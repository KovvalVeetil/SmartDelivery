# spec/services/route_optimizer_service_spec.rb
require 'rails_helper'

RSpec.describe RouteOptimizerService, type: :service do
  describe '.haversine_distance' do
    it 'calculates the correct distance between two points' do
      # Test coordinates for New York and Los Angeles
      lat1 = 40.730610
      lon1 = -73.935242
      lat2 = 34.052235
      lon2 = -118.243683

      distance = RouteOptimizerService.haversine_distance(lat1, lon1, lat2, lon2)

      # Check that the distance is correct within a margin of error
      expect(distance).to be_within(0.1).of(3940.1) # Expected distance in kilometers
    end
  end

  describe '.optimize_route' do
    it 'sorts orders by pickup location' do
      order1 = Order.create!(pickup_location: Location.create!(latitude: 40.730610, longitude: -73.935242))
      order2 = Order.create!(pickup_location: Location.create!(latitude: 34.052235, longitude: -118.243683))

      optimized_orders = RouteOptimizerService.optimize_route([order1, order2])

      expect(optimized_orders.first).to eq(order1)
      expect(optimized_orders.last).to eq(order2)
    end
  end
end
