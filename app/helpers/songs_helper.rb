module SongsHelper
  def song_title
    "#{@song.name} - #{@song.artist}"
  end
end
