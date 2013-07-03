class PromotionsController < InheritedResources::Base
  actions :all, :except => [ :create ]

  def create
    @promotion = Promotion.new(params[:promotion])

    respond_to do |format|
      if @promotion.save
        @song = Song.find(@promotion.indicator)
        if @promotion.wall_post?
          # User.delay.promote_request(current_user.id, song_url(@song))
          # WallPost.delay.title(@song)
        end
        format.html { redirect_to promote_song_path(@promotion.indicator) }
        format.json { head :no_content }
      else
        format.html { redirect_to songs_path }
        format.json { head :no_content }
      end
    end
  end

end
