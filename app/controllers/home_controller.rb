class HomeController < ApplicationController
  def index
  end
  def dashboard
    @songs = Song.find_with_reputation(:votes, :all, order: "votes desc")
    @accepted_songs = Song.find(:all, order: "updated_at desc", :conditions => { :status => "1"}, :limit => "3")
    @latest_songs = Song.find_with_reputation(:votes, :all, order: "created_at desc", :limit => "7")
    @paintings = Painting.find(:all, order: "created_at desc", :limit => "5")
  end
  def reload_latest_songs
    @latest_songs = Song.find_with_reputation(:votes, :all, order: "created_at desc", :limit => "7")
    render :partial => "latest_songs"
  end

  def reload_top_songs
    @songs = Song.find_with_reputation(:votes, :all, order: "votes desc")
    render :partial => "top_requests"
  end
  def reload
    @accepted_songs = Song.find(:all, order: "updated_at desc", :conditions => { :status => "1"}, :limit => "3")
    render :partial => "accepted_songs"
  end
  def marquee
    @accepted_songs = Song.find(:all, order: "updated_at desc", :conditions => { :status => "1"}, :limit => "3")
    render :partial => "marquee"
  end
  def activity
    @paintings = Painting.find(:all, order: "created_at desc", :limit => "5")
    render :partial => "activity"
  end
end
