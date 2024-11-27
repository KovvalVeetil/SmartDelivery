class Route < ApplicationRecord
    validates :start_location, :end_location, :distance, presence: true
    validates :distance, numericality: { greater_than: 0 }
  end
  