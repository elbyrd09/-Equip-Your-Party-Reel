class Picture < ApplicationRecord
  belongs_to :item

  validates_length_of :description, minimum: 15, maximum: 500, presence: true
end
