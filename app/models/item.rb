class Item < ApplicationRecord
  belongs_to :user
  has_many :rentals
  has_many :pictures
  has_many :reviews, through: :rentals
end
