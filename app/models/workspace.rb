class Workspace < ActiveRecord::Base
  mount_uploader :photo1, PhotoUploader
  has_many :bookings
  has_attachments :photos, maximum: 10
end
