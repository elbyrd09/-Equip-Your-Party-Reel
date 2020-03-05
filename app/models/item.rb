class Item < ApplicationRecord
  belongs_to :user
  has_many :rentals
  has_many :pictures
  has_many :reviews, through: :rentals

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # took this out for now, gave an error when submitting a full number: format: { with: /\A\d+(?:\.\d{1})?\z/ },
  validates :price_per_day, presence: true, numericality: { greater_than: 0, less_than: 1000000 }
  validates :product_description, length: {minimum: 15, maximum: 500}, presence: true
  validates :item_category, inclusion: { in: ['Camera', 'Accessory', 'Lens'] }
  validates :user_description, length: {minimum: 15, maximum: 500}, presence: true
  validates :condition, presence: true
  validates :condition, inclusion: { in: ['Poor', 'Sufficient', 'Good', 'As new'] }

end
