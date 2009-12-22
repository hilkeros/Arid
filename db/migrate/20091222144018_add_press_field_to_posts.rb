class AddPressFieldToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :press, :boolean, :default => false
  end

  def self.down
    remove_column :posts, :press
  end
end
