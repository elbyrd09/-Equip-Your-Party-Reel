class Picture < ApplicationRecord
  belongs_to :item

  validates :description, length: {minimum: 15, maximum: 500}, presence: true

  has_one_attached :photo
end
