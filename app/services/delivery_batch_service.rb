class DeliveryBatchService
    def initialize(driver:, orders:)
      @driver = driver
      @orders = orders
    end
  
    def process_batch
      validate_batch_capacity
      optimized_route = optimize_route
      assign_driver_to_orders # Dynamically assign driver after processing the batch
    end
  
    private
  
    def validate_batch_capacity
      total_weight = @orders.sum(&:weight)
      raise "Batch weight exceeds driver capacity" if total_weight > @driver.capacity
    end
  
    def optimize_route
      # Assuming `optimized_route` is derived from sorting or some optimization logic
      optimized_route = @orders.sort_by { |order| [order.pickup_location.latitude, order.pickup_location.longitude] }
    
      total_distance = 0
      total_time = 0
    
      optimized_route.each_cons(2) do |current_order, next_order|
        distance = RouteOptimizerService.haversine_distance(
          current_order.pickup_location.latitude, current_order.pickup_location.longitude,
          next_order.pickup_location.latitude, next_order.pickup_location.longitude
        )
        total_distance += distance
        total_time += distance / 30.0 # Assuming 30 km/h average speed
      end
    
      # Create the batch with optimized route details
      DeliveryBatch.create!(
        driver: @driver,
        orders: @orders,
        total_distance: total_distance,
        total_time: total_time,
        optimized_route: optimized_route.map { |order| order.pickup_location.id }.join(" -> ")
      )
    end
  
    def assign_driver_to_orders
      @orders.each do |order|
        order.update!(driver: @driver) # Dynamically assign the driver to each order
      end
    end
  end
  