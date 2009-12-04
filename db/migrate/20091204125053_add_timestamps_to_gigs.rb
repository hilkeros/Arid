class AddTimestampsToGigs < ActiveRecord::Migration
  def self.up
    add_column :gigs, :created_at, :datetime
    add_column :gigs, :updated_at, :datetime
    Gig.all.each do |gig|
      gig.created_at = Time.now
      gig.updated_at = Time.now
    end
  end

  def self.down
    remove_column :gigs, :updated_at
    remove_column :gigs, :created_at
  end
end
