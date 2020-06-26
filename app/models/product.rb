class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: true, presence: true
  validates :store_id, presence: true, numericality: true
end
