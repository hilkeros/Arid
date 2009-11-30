class CreateGigs < ActiveRecord::Migration
  def self.up
    create_table :gigs do |t|

      t.column  :date,      :date
      t.column  :time,      :time
      t.column  :venue,     :string
      t.column  :venue_url, :string
      t.column  :city,      :string
      t.column  :country,   :string
      
    end
  end

  def self.down
    drop_table :gigs
  end
end
