class AddUrlToVideos < ActiveRecord::Migration
  def self.up
    add_column :videos, :url, :string
    add_column :videos, :name, :string
  end

  def self.down
    remove_column :videos, :name
    remove_column :videos, :url
  end
end
