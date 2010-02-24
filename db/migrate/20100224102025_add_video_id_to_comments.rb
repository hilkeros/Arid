class AddVideoIdToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :photo_id, :integer
  end

  def self.down
    remove_column :comments, :photo_id
  end
end
