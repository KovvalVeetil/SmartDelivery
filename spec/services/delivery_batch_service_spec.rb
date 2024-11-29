# require 'rails_helper'

# RSpec.describe DeliveryBatchService, type: :service do
#   let(:driver) { Driver.create!(name: 'Test Driver', current_location: '40.7306,-73.9352', capacity: 100, available: true) }
  
#   # Create Locations for pickup and dropoff
#   let(:pickup_location1) { Location.create!(latitude: 40.7306, longitude: -73.9352) }
#   let(:dropoff_location1) { Location.create!(latitude: 40.7416, longitude: -73.9352) }
#   let(:pickup_location2) { Location.create!(latitude: 40.7406, longitude: -73.9352) }
#   let(:dropoff_location2) { Location.create!(latitude: 40.7506, longitude: -73.9352) }

#   # Create Orders with reference to Locations
#   let(:order1) { Order.create!(pickup_location_id: pickup_location1.id, dropoff_location_id: dropoff_location1.id, weight: 10, status: 'pending') }
#   let(:order2) { Order.create!(pickup_location_id: pickup_location2.id, dropoff_location_id: dropoff_location2.id, weight: 15, status: 'pending') }
#   let(:orders) { [order1, order2] }
#   let(:delivery_batch_service) { described_class.new(driver: driver, orders: orders) }

#   describe '#process_batch' do
#     context 'when the batch does not exceed the driver capacity' do
#       it 'assigns the driver to all orders' do
#         delivery_batch_service.process_batch
#         orders.each do |order|
#           expect(order.reload.driver).to eq(driver)
#         end
#       end

#       it 'creates a delivery batch' do
#         expect {
#           delivery_batch_service.process_batch
#         }.to change(DeliveryBatch, :count).by(1)
#       end
#     end

#     context 'when the batch exceeds the driver capacity' do
#       let(:driver_overloaded) { Driver.create!(name: 'Overloaded Driver', current_location: '40.7306,-73.9352', capacity: 20, available: true) }
#       let(:orders_exceeding_capacity) { [order1, order2] }

#       it 'raises an error' do
#         service = described_class.new(driver: driver_overloaded, orders: orders_exceeding_capacity)
#         expect { service.process_batch }.to raise_error("Batch weight exceeds driver capacity")
#       end
#     end
#   end
# end
