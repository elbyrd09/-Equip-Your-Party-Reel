class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :review

  validates :start_dat, presence: true
  validates :end_date, presence: true
  validates :total_price, presence: true

end
