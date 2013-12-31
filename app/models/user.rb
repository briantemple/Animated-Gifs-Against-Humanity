class User < ActiveRecord::Base
  has_and_belongs_to_many :games

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.avatar_url = auth.info.image
      user.save!
    end
  end

  def self.from_uid(uid, friends)
    where(:uid => uid).first_or_initialize.tap do |user|
      if user.new_record?
        friend_stub = friends.find {|friend| friend['id'] == uid}
        user.provider = 'facebook'
        user.uid = friend_stub['id']
        user.name = friend_stub['name']
        user.avatar_url = friend_stub['picture']['data']['url']
        user.save!
      end
    end
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
    block_given? ? yield(@facebook) : @facebook
  rescue Koala::Facebook::APIError => e
    logger.info e.to_s
    nil
  end

  def friends
    facebook { |fb| fb.get_connections("me", "friends?fields=id,name,picture.type(square)") }
  end
end
