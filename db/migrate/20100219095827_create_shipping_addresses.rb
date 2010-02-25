class CreateShippingAddresses < ActiveRecord::Migration
  def self.up
    create_table :shipping_addresses do |t|
      t.string :firstname
      t.string :lastname
      t.string :street
      t.string :zip
      t.string :city
      t.string :country
      t.string :phone
      t.string :email

      t.belongs_to :order

      t.timestamps
    end
  end

  def self.down
    drop_table :licensees
  end
end
