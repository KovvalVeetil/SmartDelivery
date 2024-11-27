# Create Drivers
5.times do |i|
    Driver.create!(
      name: "Driver #{i + 1}",
      current_location: "Location #{i + 1}",
      capacity: rand(50..100),
      available: [true, false].sample
    )
  end
  
  # Create Orders
  10.times do |i|
    Order.create!(
      pickup_location: "Location #{i + 1}",
      dropoff_location: "Location #{i + 2}",
      weight: rand(10..50),
      status: %w[pending delivered cancelled].sample
    )
  end
  