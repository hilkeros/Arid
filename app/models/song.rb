class Song < ActiveRecord::Base
  has_many :fav_songs
  has_many :users, :through => :fav_songs
end
