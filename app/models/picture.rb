class Picture < ApplicationRecord
  belongs_to :item

  validates :description, length: {minimum: 15, maximum: 500}, presence: true
end
