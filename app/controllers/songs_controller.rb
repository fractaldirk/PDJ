class SongsController < ApplicationController
  before_filter :prepare_for_mobile, :except => [:new, :create, :edit_gettrack,
  :update]

  def index
    @top_songs = Song.find_with_reputation(:votes, :all, order: "votes desc", :conditions => ["status = ?", 99], :limit => "5")
    @lists = List.find(:all)
  end

  def all_songs
    @all_songs = Song.find_with_reputation(:votes, :all, order: "votes desc", :conditions => ["status = ?", 99])
    @lists = List.find(:all)
  end

  def vote
    value = params[:type] == "up" ? 1 : -1
    @song = Song.find(params[:id])
    @song.add_or_update_evaluation(:votes, value, current_user)
    redirect_to songs_all_songs_path
  end

  def gettrack
    redirect_to songs_gettracky_path
    @lists = List.find(:all)
  end

  def gettracky
    @songs = Song.find_with_reputation(:votes, :all, order: "votes desc")
    @lists = List.find(:all)
  end

  def gettrackyy
    @songs = Song.find_with_reputation(:votes, :all, order: "votes desc")
    @lists = List.find(:all)
  end

  def tracklist
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
    @lists = List.find(:all)
  end

  def promote
    @song = Song.find(params[:id])
    @lists = List.find(:all)
  end

  def promote_passe
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

  def new_promotion
    @song = Song.find(params[:id])
    @promotion = Promotion.new
  end

  def add
    @song = Song.new
  end

  def edit
    @song = Song.find(params[:id])
  end

  def edit_gettrack
    @song = Song.find(params[:id])
    @user = User.find(@song.user_id)
    @lists = List.find(:all)
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
        redirect_to songs_all_songs_path
      else
        render action: "new"
      end
  end

  def update
    @song = Song.find(params[:id])
    @user = User.find(@song.user_id)

      if params[:song_status]
        if current_user
          @song.update_attributes(params[:song])
            @user.update_attribute(:score, @user.score + @song.points)
            Painting.delay.create(promotion: false, song_name: @song.name)
            WallPost.delay.accepted(@song)
        else
          @song.update_attributes(params[:song])
          @user.update_attribute(:score, @user.score + @song.points)
        end
        redirect_to songs_gettracky_path(@songs)
      elsif params[:new_song]
        @song.update_attributes(params[:song])
        redirect_to @song
      else
        render action: "edit"
      end
  end

  def destroy
    @song = Song.find(params[:id])
    if @song.destroy
      redirect_to songs_gettrack_path(:format => :mobile)
    else
      render action: "gettrack"
    end
  end

  # playlists

  def playlists

  end

  def poprock
    @song = Song.new
    @lists = List.find(:all, :order => "created_at DESC", :conditions => [ "genre = ?", 10 ], :limit => 20)

    respond_to do |format|
      format.mobile { render "songs/forms/pop_rock" }
    end
  end

  def rock
    @song = Song.new
    @lists = List.find(:all, :order => "created_at DESC", :conditions => [ "genre = ?", 2 ], :limit => 20)

    respond_to do |format|
      format.mobile { render "songs/forms/rock" }
    end
  end

  def indie
    @song = Song.new
    @lists = List.find(:all, :order => "created_at DESC", :conditions => [ "genre = ?", 9 ], :limit => 20)

    respond_to do |format|
      format.mobile { render "songs/forms/indie" }
    end
  end

private

  def prepare_for_mobile
    session[:mobile_param] = params[:mobile] if params[:mobile]
    request.format = :mobile if mobile_device?
  end
end
