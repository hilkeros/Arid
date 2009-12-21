class AddExclusivePostsToNews < ActiveRecord::Migration
  def self.up
    add_column :posts, :exclusive, :boolean, :default => false
  end

  def self.down
    remove_column :posts, :exclusive
  end
end
