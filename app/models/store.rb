class Store < ApplicationRecord
  has_many :products, dependent: :delete_all
  validates :name, presence: true
  validates :phone, numericality: true, presence: true
end
