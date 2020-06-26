class Product < ApplicationRecord
  has_many :labels, dependent: :delete_all
  validates :name, presence: true
  validates :price, numericality: true, presence: true
  validates :store_id, presence: true, numericality: true
end
