class ApiController < ApplicationController
  def successful_requests
    @accepted_requests = Song.find_with_reputation(:votes, :all, order: "votes desc", :conditions => ["status = ?", 1])

    respond_to do |format|
      format.json { render json: @accepted_requests }
    end
  end

  def latest_successful_requests
    @latest_accepted_requests = Song.find_with_reputation(:votes, :all, order: "created_at desc", :conditions => ["status = ?", 1], :limit => 5)

    respond_to do |format|
      format.json { render json: @latest_accepted_requests }
    end
  end
end
