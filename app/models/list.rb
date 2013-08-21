class List < ActiveRecord::Base
  attr_accessible :artist, :list_id, :title, :genre

  def song_title
    artist + " - " + title
  end
end
