class SocialNetworkUpdate < ActiveRecord::Migration
  def self.up
    change_column :users, :myspace_uid, :string
    change_column :users, :twitter_uid, :string
    change_column :users, :netlog_uid, :string
  end

  def self.down
    change_column :users, :myspace_uid, :integer
    change_column :users, :twitter_uid, :integer
    change_column :users, :netlog_uid, :integer
  end
end
