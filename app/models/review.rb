class Review < ApplicationRecord
  belongs_to :rental

  validates :content, length: {minimum: 15, maximum: 500}, presence: true
  validates :rating, presence: true
end
