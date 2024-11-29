# app/services/route_optimizer_service.rb

class RouteOptimizerService
    # Haversine formula to calculate the distance between two points (lat, lon) on the Earth
    def self.haversine_distance(lat1, lon1, lat2, lon2)
      # Radius of the Earth in kilometers
      radius = 6_371
  
      # Convert degrees to radians
      lat1_rad = to_radians(lat1)
      lon1_rad = to_radians(lon1)
      lat2_rad = to_radians(lat2)
      lon2_rad = to_radians(lon2)
  
      # Haversine formula
      delta_lat = lat2_rad - lat1_rad
      delta_lon = lon2_rad - lon1_rad
  
      a = Math.sin(delta_lat / 2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(delta_lon / 2)**2
      c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
  
      # Calculate distance in kilometers
      radius * c
    end
  
    # Optimizes the delivery route based on orders' pickup locations
    def self.optimize_route(orders)
      # Sort orders by pickup location (simplified example)
      orders.sort_by { |order| [order.pickup_location.latitude, order.pickup_location.longitude] }
    end
  
    private
  
    # Converts degrees to radians
    def self.to_radians(degrees)
      degrees * Math::PI / 180
    end
  end
  