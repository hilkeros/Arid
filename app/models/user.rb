class User < ActiveRecord::Base
  acts_as_authentic do |user|
    user.login_field :email
  end

  has_many :comments
  has_many :photos
  has_many :videos
  has_many :fav_songs
  has_many :songs, :through => :fav_songs
  has_many :orders
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :activities
  
  
  has_many :shouts
  has_many :friend_shouts, :class_name => 'Shout', :foreign_key => 'friend_id'
  
  has_attached_file :avatar,
    :styles => { 
        :thumb => [ "32x32>", :jpg ], 
        :small => [ "100x100>", :jpg ], 
        :medium => [ "450x450>", :jpg ], 
        :large => [ "700x500>", :jpg ] 
    },
    :url  => "/assets/users/:style/:id.:extension",
    :path => ":rails_root/public/assets/users/:style/:id.:extension"

  def deliver_password_reset_instructions!  
    reset_perishable_token!  
    Notifier.deliver_password_reset_instructions(self)  
  end

  def before_connect(facebook_session)
    self.name = facebook_session.user.name
  end
  
  def update_favorite_songs favorite_songs
    favorite_songs.each do |fsong|
      if fsong[:id].present?
        favorite_song = self.fav_songs.find(fsong[:id])
      else
        favorite_song = self.fav_songs.new
      end
      favorite_song.song_id = fsong[:song_id]
      favorite_song.save
    end
  end
  
  def is_following?(user)
    friends.include?(user)
  end

end
