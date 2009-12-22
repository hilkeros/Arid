class AddFacebookConnectFieldsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :facebook_uid, :integer, :limit => 8
    rename_column :users, :username, :name
  end

  def self.down
    rename_column :users, :name, :username
    remove_column :users, :facebook_uid
  end
end
