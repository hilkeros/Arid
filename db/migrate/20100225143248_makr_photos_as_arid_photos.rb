class MakrPhotosAsAridPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :arid, :boolean, :default => false
  end

  def self.down
    remove_column :photos, :arid
  end
end
