class Painting < ActiveRecord::Base
  attr_accessible :painter, :painter_id, :image
  mount_uploader :image, ImageUploader
end
