class HomeController < ApplicationController
  def index
  end
  def dashboard
    @songs = Song.find_with_reputation(:votes, :all, order: "votes desc", :limit => "5")
    @accepted_songs = Song.find(:all, order: "updated_at desc", :conditions => { :status => "1"}, :limit => "5")
  end
  def latest_songs
    @latest_songs = Song.find_with_reputation(:votes, :all, order: "created_at desc", :limit => "5")
  end
end
