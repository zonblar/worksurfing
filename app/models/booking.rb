class Booking < ActiveRecord::Base
  belongs_to :workspace
  belongs_to :user
  monetize :amount_cents
  validates :start_date, presence: true
  validates :end_date, presence: true
end
