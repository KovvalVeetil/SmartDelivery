# app/models/order.rb
class Order < ApplicationRecord
  enum status: { pending: 'pending', in_transit: 'in_transit', delivered: 'delivered' }
  belongs_to :pickup_location, class_name: 'Location'
  belongs_to :dropoff_location, class_name: 'Location'
  belongs_to :delivery_batch, optional: true
  validates :weight, presence: true
end
