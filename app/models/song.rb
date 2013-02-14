class Song < ActiveRecord::Base
  attr_accessible :artist, :name, :requester, :ref
end
