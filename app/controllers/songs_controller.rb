class SongsController < ApplicationController
  # GET /songs
  # GET /songs.json
  def index
    @songs = Song.find_with_reputation(:votes, :all, order: "votes desc")

    respond_to do |format|
      format.html # songlist.html.erb
      format.json { render json: @songs }
      format.mobile # songlist.mobile.erb
    end
  end

  def vote
    value = params[:type] == "up" ? 1 : -1
    @song = Song.find(params[:id])
    @song.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back
  end

  def tracklist
    @songs = Song.all

    respond_to do |format|
      format.html # songlist.html.erb
      format.json { render json: @songs }
      format.mobile
    end
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
    @song = Song.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @song }
      format.mobile
    end
  end

  def promote
    @song = Song.find(params[:id])
      if current_user
        User.delay.promote_request(current_user.id, song_url(@song))
      end
    respond_to do |format|
      format.html { redirect_to @song, notice: 'Song was successfully promoted!' }
      format.json { render json: @song, status: :created, location: @song }
      format.mobile
    end
  end

  # GET /songs/new
  # GET /songs/new.json
  def new
    @song = Song.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @song }
      format.mobile
    end
  end

  def add
    @song = Song.new

    respond_to do |format|
      format.html # add.html.erb
      format.json { render json: @song }
      format.mobile
    end
  end

  # GET /songs/1/edit
  def edit
    @song = Song.find(params[:id])
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(params[:song])

    respond_to do |format|

      if params[:new_song]
        @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render json: @song, status: :created, location: @song }
        format.mobile { redirect_to @song, notice: 'Song was successfully created.' }
      elsif params[:request_song]
        @song.save
          if current_user
            User.delay.share_request(current_user.id, song_url(@song))
          end
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render json: @song, status: :created, location: @song }
        format.mobile { redirect_to @song, notice: 'Song was successfully created.' }
      else
        format.html { render action: "new" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
        format.mobile { render action: "new" }
      end
    end
  end

  # PUT /songs/1
  # PUT /songs/1.json
  def update
    @song = Song.find(params[:id])

    respond_to do |format|
      if @song.update_attributes(params[:song])
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { head :no_content }
        format.mobile { redirect_to @song, notice: 'Song was successfully updated.' }
      else
        format.html { render action: "edit" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
        format.mobile { render action: "edit" }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song = Song.find(params[:id])
    @song.destroy

    respond_to do |format|
      format.html { redirect_to songs_url }
      format.json { head :no_content }
      format.mobile { redirect_to songs_url }
    end
  end
end
