class Store < ApplicationRecord
  validates :name, presence: true
  validates :phone, numericality: true
end
