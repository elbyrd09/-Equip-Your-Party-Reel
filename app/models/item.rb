class Item < ApplicationRecord
  belongs_to :user
  has_many :rentals
  has_many :pictures
  has_many :reviews, through: :rentals

  include PgSearch::Model

  pg_search_scope :search_by_brand_and_model_and_item_category,
      against: [ :brand, :model, :item_category ],
      using: {
        tsearch: { prefix: true, dictionary: 'english' }
        }

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
