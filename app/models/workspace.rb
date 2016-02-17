class Workspace < ActiveRecord::Base
  mount_uploader :photo1, PhotoUploader
  has_many :bookings
  has_many :availabilities, :dependent => :destroy
  belongs_to :user

  def available?(booking)
   output = true
   self.availabilities.each do |availability|

      if (booking.end_date <= availability.start_date || booking.end_date >= availability.end_date || booking.start_date < availability.start_date)
        output = false
      end
    end
    output
  end
  has_attachments :photos, maximum: 10
end

