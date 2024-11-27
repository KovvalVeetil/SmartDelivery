class Order < ApplicationRecord
    belongs_to :delivery_batch, optional: true
  
    validates :pickup_location, :dropoff_location, :weight, :status, presence: true
    validates :weight, numericality: { greater_than: 0 }
  end