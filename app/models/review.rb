class Review < ApplicationRecord
  belongs_to :rental

  validates :content, length: {minimum: 15, maximum: 500}, presence: true
  validates :rating, inclusion { in: (1..5) }, presence: true
end
