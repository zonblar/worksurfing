class Workspace < ActiveRecord::Base
  mount_uploader :photo1, PhotoUploader
end
