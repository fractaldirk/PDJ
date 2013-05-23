class AdminController < ApplicationController
  def statistics
    @top_users = User.find(:all, :order => "score DESC", :limit => 5)
    @last_top_users = Song.find(:all, :conditions => {"created_at > ?", 1.week.ago}, :order => "points ASC", :group => "user_name", :limit => 5)
  end

  def top_users
    @users = User.find(:all, :order => "score DESC")
  end

  def statisticz
    @users = User.find(:all, :order => "score DESC", :limit => 5)
  end
end
