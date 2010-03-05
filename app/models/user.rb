require 'open-uri'

class User < ActiveRecord::Base
  acts_as_authentic do |usr|
    usr.login_field :email
    usr.validate_email_field = false
    usr.validate_password_field = false
    usr.validate_login_field = false
  end
  has_permalink :name

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
  
  validates_presence_of :email, :if => :not_logged_in_with_facebook
  validates_uniqueness_of :email, :if => :not_logged_in_with_facebook
  
  attr_accessor :password
  validates_presence_of     :password,                   :if => :not_logged_in_with_facebook
  validates_confirmation_of :password,                   :if => :not_logged_in_with_facebook
  validates_length_of       :password, :within => 6..40, :if => :not_logged_in_with_facebook
  
  has_attached_file :avatar,
    :styles => { 
        :thumb => [ "20x20>", :jpg ], 
        :friends => [ "36x36>", :jpg ], 
        :small => [ "54x54>", :jpg ], 
        :profile => [ "80x80>", :jpg ], 
        :medium => [ "450x450>", :jpg ], 
        :large => [ "700x500>", :jpg ] 
    },
    :url  => "/assets/users/:style/:id.:extension",
    :path => ":rails_root/public/assets/users/:style/:id.:extension"
    
  def to_param
    permalink
  end
    
  def deliver_password_reset_instructions!  
    reset_perishable_token!  
    Notifier.deliver_password_reset_instructions(self)  
  end

  def before_connect(facebook_session)
    self.name = facebook_session.user.name
    self.send(:create_unique_permalink)
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

  def age
    date = Date.current
    dob = birth_date
    return "" if dob.blank?
    day_diff = date.day - dob.day
    month_diff = date.month - dob.month - (day_diff < 0 ? 1 : 0)
    date.year - dob.year - (month_diff < 0 ? 1 : 0)
  end
  
  def fill_with_facebook(facebook_session)
    self.birth_date = Date.parse(facebook_session.user.birthday) if  self.birth_date.blank? && facebook_session.user.birth_date.present?
    self.gender = facebook_session.user.sex.titleize if self.gender.blank? && facebook_session.user.sex.present?
    self.avatar = open(facebook_session.user.pic) if !self.avatar.file? && facebook_session.user.pic.present?
    self.save!
  end
  
  protected
  
  def not_logged_in_with_facebook
    self.facebook_uid.blank?
  end

end
