class Workspace < ActiveRecord::Base
  scoped_search :on => :city, :complete_value => :true
  scoped_search on: [:nb_people, :price_per_day, :printer, :bathroom, :wifi]
  mount_uploader :photo1, PhotoUploader
  has_many :bookings
  has_many :availabilities
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  has_many :availabilities, :dependent => :destroy
  belongs_to :user
  monetize :price_cents

  has_many :reviews, dependent: :destroy


  # def available?(booking)
  #  output = true
  #  self.availabilities.each do |availability|

  #     if (booking.end_date <= availability.start_date || booking.end_date >= availability.end_date || booking.start_date < availability.start_date)
  #       output = false
  #     end
  #   end
  #   output
  # end

  has_attachments :photos, maximum: 10
end

