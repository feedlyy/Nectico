class Label < ApplicationRecord
  validates :name, presence: true
  validates :product_id, presence: true, numericality: true
end
