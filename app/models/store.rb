class Store < ApplicationRecord
  has_many :products, dependent: :destroy
  validates :name, presence: true
  validates :phone, numericality: true, presence: true
end
