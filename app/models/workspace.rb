class Workspace < ActiveRecord::Base
  mount_uploader :photo1, PhotoUploader
  has_many :bookings
end
