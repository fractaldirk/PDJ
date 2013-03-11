class SongsController < ApplicationController
  before_filter :prepare_for_mobile, :except => [:new, :create]

  def index
    @songs = Song.find_with_reputation(:votes, :all, order: "votes desc")
  end

  def vote
    value = params[:type] == "up" ? 1 : -1
    @song = Song.find(params[:id])
    @song.add_or_update_evaluation(:votes, value, current_user)
    redirect_to songs_url
  end

  def gettrack
    @songs = Song.find_with_reputation(:votes, :all, order: "votes desc")
  end

  def tracklist
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def promote
    @song = Song.find(params[:id])
      if current_user
        User.delay.promote_request(current_user.id, song_url(@song))
        WallPost.delay.title(@song)
        Painting.delay.create(painter: "#{current_user.name}", external_link: "/assets/pizza.jpg", promotion: true, song_name: @song.name, song_artist: @song.artist)
      end
  end

  def new
    @song = Song.new
  end

  def add
    @song = Song.new
  end

  def edit
    @song = Song.find(params[:id])
  end

  def edit_gettrack
    @song = Song.find(params[:id])
  end

  def create
    @song = Song.new(params[:song])

      if params[:new_song]
        @song.save
        redirect_to songs_path
      elsif params[:request_song]
        @song.save
          if current_user
            User.delay.share_request(current_user.id, song_url(@song))
          end
        redirect_to songs_path
      else
        render action: "new"
      end
  end

  def update
    @song = Song.find(params[:id])

      if params[:song_status]
        @song.update_attributes(params[:song])
          if current_user
            Painting.delay.create(promotion: false, song_name: @song.name)
          end
        redirect_to "/songs/gettrack/", notice: 'Song was successfully updated.'
      elsif params[:new_song]
        @song.update_attributes(params[:song])
        redirect_to @song, notice: 'Song was successfully updated.'
      else
        render action: "edit"
      end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
  end

private

  def prepare_for_mobile
    session[:mobile_param] = params[:mobile] if params[:mobile]
    request.format = :mobile if mobile_device?
  end
end
