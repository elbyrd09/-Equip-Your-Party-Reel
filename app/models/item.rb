class Item < ApplicationRecord
  belongs_to :user
  has_many :rentals
  has_many :pictures
  has_many :reviews, through: :rentals

  validates :price_per_day, presence: true
  validates_length_of :product_description, minimum: 15, maximum: 500 presence: true
  validates :equipment_category, presence: true
  validates_length_of :user_description, minimum: 15, maximum: 500 presence: true
  validates :condition, presence: true
end
