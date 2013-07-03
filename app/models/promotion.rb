class Promotion < ActiveRecord::Base
  attr_accessible :artist, :message, :name, :promoter, :indicator, :wall_post
end
