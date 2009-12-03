class AddTicketsUrl < ActiveRecord::Migration
  def self.up
    add_column :gigs, :tickets_url, :string
  end

  def self.down
    remove_column :gigs, :tickets_url
  end
end
