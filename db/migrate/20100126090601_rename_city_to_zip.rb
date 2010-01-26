class RenameCityToZip < ActiveRecord::Migration
  def self.up
    rename_column :users, :city, :zip
  end

  def self.down
    rename_column :users, :zip, :city
  end
end
