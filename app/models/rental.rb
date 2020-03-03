class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :review

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :total_price, presence: true

end
