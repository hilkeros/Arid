class FavSongNeedsId < ActiveRecord::Migration
  def self.up
    add_column :fav_songs, :id, :integer
  end

  def self.down
    remove_column :fav_songs, :id
  end
end
