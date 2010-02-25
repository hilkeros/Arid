class AddPermalinkToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :permalink, :string
    User.all.each do |usr|
      usr.send(:create_unique_permalink)
      usr.save(:perform_validation => false)
    end
  end

  def self.down
    remove_column :users, :permalink
  end
end
