class WallPost < ActionMailer::Base
  default from: "dirkgrandjean@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.wall_post.title.subject
  #
  def title(song)
    @song = song

    mail to: "fawn236peaked@m.facebook.com", subject: song.song_promoted
  end

  def accepted(song)
    @song = song

    mail to: "fawn236peaked@m.facebook.com", subject: song.song_accepted
  end
end
