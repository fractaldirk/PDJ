class Song < ActiveRecord::Base
  attr_accessible :artist, :name, :requester, :ref, :status

  has_reputation :votes, source: :user, aggregated_by: :sum
end
