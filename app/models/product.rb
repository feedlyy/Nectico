class Product < ApplicationRecord
  has_many :labels, dependent: :destroy
  validates :name, presence: true
  validates :price, numericality: true, presence: true
  validates :store_id, presence: true, numericality: true
end
