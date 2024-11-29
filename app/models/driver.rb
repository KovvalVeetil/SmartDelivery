class Driver < ApplicationRecord
    has_many :delivery_batches
    has_many :orders
  
    validates :name, :current_location, :capacity, presence: true
    validates :capacity, numericality: { greater_than_or_equal_to: 0 }
  end
  