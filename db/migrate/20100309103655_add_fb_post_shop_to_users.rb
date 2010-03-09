class AddFbPostShopToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :fb_post_shop, :boolean
  end

  def self.down
    remove_column :users, :fb_post_shop
  end
end
