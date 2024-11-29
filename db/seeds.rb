# db/seeds.rb

Driver.destroy_all
Order.destroy_all
DeliveryBatch.destroy_all

# Create a driver
driver = Driver.create!(name: 'Test Driver', current_location: '40.7306,-73.9352', capacity: 100, available: true)

# Create orders without associating them with a driver
order1 = Order.create!(pickup_location: '1', dropoff_location: '2', weight: 10, status: 'pending')
order2 = Order.create!(pickup_location: '3', dropoff_location: '4', weight: 15, status: 'pending')

# Now assign the driver to the orders dynamically (this would be done via the service in a real scenario)
orders = [order1, order2]
delivery_batch_service = DeliveryBatchService.new(driver: driver, orders: orders)
delivery_batch_service.process_batch
