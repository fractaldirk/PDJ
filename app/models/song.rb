class Song < ActiveRecord::Base
  attr_accessible :artist, :name, :requester, :ref, :status, :user_id
  belongs_to :user

  has_reputation :votes, source: :user, aggregated_by: :sum

  def song_title
    "#{name} - #{artist}"
  end

  def song_promoted
    "VOTE NOW FOR: #{song_title} requested by #{requester}"
  end

  def song_accepted
    "Like a boss, #{requester}! Let's play #{song_title}"
  end
end
