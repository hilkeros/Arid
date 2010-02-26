class AddNameToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :name, :string
  end

  def self.down
    remove_column :photos, :name
  end
end
