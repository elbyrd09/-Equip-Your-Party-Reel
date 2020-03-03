class Item < ApplicationRecord
  belongs_to :user
  has_many :rentals
  has_many :pictures
  has_many :reviews, through: :rentals

  validates :price_per_day, presence: true
  validates :product_description, length: {minimum: 15, maximum: 500}, presence: true
  validates :equipment_category, presence: true
  validates :user_description, length: {minimum: 15, maximum: 500}, presence: true
  validates :condition, presence: true

end
