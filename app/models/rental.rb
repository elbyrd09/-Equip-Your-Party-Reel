class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :review

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate  :end_date_after_start_date

def unavailable_dates
    rentals.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end


  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
 end
end
