class AddMoreDataToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :profile_picture, :string
    add_column :users, :gender, :boolean
    add_column :users, :birth_date, :date
    add_column :users, :country, :string
    add_column :users, :fav_arid_song, :string
    add_column :users, :fb_post_comment, :boolean
    add_column :users, :fb_post_photo, :boolean
    add_column :users, :fb_post_video, :boolean
    add_column :users, :myspace_uid, :integer
    add_column :users, :twitter_uid, :integer
    add_column :users, :netlog_uid, :integer    
  end
    
  def self.down
    remove_column :users, :profile_picture
    remove_column :users, :gender
    remove_column :users, :birth_date
    remove_column :users, :country
    remove_column :users, :fav_arid_song
    remove_column :users, :fb_post_comment
    remove_column :users, :fb_post_photo
    remove_column :users, :fb_post_video
    remove_column :users, :myspace_uid
    remove_column :users, :twitter_uid
    remove_column :users, :netlog_uid
  end
end
