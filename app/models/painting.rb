class Painting < ActiveRecord::Base
  attr_accessible :painter, :painter_id, :image, :external_link, :promotion, :boolean,
                  :song_name, :song_artist
  mount_uploader :image, ImageUploader
end
