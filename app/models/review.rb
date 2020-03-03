class Review < ApplicationRecord
  belongs_to :rental

  validates_length_of :content, minimum: 15, maximum: 500 presence: true
  validates :rating, presence: true
end
