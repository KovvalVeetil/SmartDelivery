require 'rails_helper'

RSpec.describe Order, type: :model do
  it "is valid with valid attributes" do
    order = Order.new(
      pickup_location: "Location 1",
      dropoff_location: "Location 2",
      weight: 25.5,
      status: "pending"
    )
    expect(order).to be_valid
  end

  it "is invalid without a pickup_location" do
    order = Order.new(dropoff_location: "Location 2", weight: 25.5, status: "pending")
    expect(order).not_to be_valid
  end
end
