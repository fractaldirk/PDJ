class AdminController < ApplicationController
  def activity

  end
  def statistics
    @users = User.find(:all, :order => "score DESC", :limit => 5)
  end

  def statisticz
    @users = User.find(:all, :order => "score DESC", :limit => 5)
  end
end
