# app/models/delivery_batch.rb
class DeliveryBatch < ApplicationRecord
  belongs_to :driver
  has_many :orders
end
