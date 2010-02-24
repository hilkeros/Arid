class AddGigIdToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :gig_id, :integer
  end

  def self.down
    remove_column :comments, :gig_id
  end
end
