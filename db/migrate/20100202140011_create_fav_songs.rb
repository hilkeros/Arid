class CreateFavSongs < ActiveRecord::Migration
  def self.up
    create_table :fav_songs do |t|
      t.integer :user_id
      t.integer :song_id
      t.integer :score

      t.timestamps
    end
  end

  def self.down
    drop_table :fav_songs
  end
end
