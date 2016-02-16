class Workspace < ActiveRecord::Base
  mount_uploader :photo1, PhotoUploader
<<<<<<< HEAD
=======
  has_many :bookings
>>>>>>> 35041f6d8a021b3a1a2de764773472c571170c7f
end
