class Song < ActiveRecord::Base
  attr_accessible :artist, :name, :requester, :ref, :status

  has_reputation :votes, source: :user, aggregated_by: :sum

  def song_title
    "#{name} - #{artist}"
  end

  def song_promoted
    "VOTE NOW FOR: #{song_title} requested by #{requester}"
  end
end
