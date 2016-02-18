class Workspace < ActiveRecord::Base
  mount_uploader :photo1, PhotoUploader
  has_many :bookings
  has_many :availabilities
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  has_many :availabilities, :dependent => :destroy
  belongs_to :user
  monetize :price_cents

  has_many :reviews, dependent: :destroy


  def available?(booking)
   output = true
   self.availabilities.each do |availability|

      if (booking.end_date.to_datetime <= availability.start_date.to_datetime || booking.end_date.to_datetime >= availability.end_date.to_datetime || booking.start_date.to_datetime < availability.start_date.to_datetime)
        output = false
      end
    end
    output
  end

  has_attachments :photos, maximum: 10
end

