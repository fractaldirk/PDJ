class User < ActiveRecord::Base
  attr_accessible :song
  has_many :songs

  has_many :evaluations, class_name: "ReputationSystem::Evaluation", as: :source

  def voted_for?(song)
    evaluations.where(target_type: song.class, target_id: song.id).present?
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.username = auth.info.nickname
      user.gender = auth.extra.raw_info.gender
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def self.promote_request(user_id, song_url)
    user = User.find(user_id)
    user.facebook.put_connections("me", "personaldj:promote", liedje: song_url)
  end

  def self.share_request(user_id, song_url)
    user = User.find(user_id)
    user.facebook.put_connections("me", "personaldj:list", liedje: song_url)
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
    block_given? ? yield(@facebook) : @facebook
  rescue Koala::Facebook::APIError => e
    logger.info e.to_s
    nil # or consider a custom null object
  end
end
