class DeliveryBatch < ApplicationRecord
    has_many :orders
    belongs_to :driver, optional: true
  
    validates :batch_name, :status, presence: true
    validates :total_weight, numericality: { greater_than_or_equal_to: 0 }
  end
  