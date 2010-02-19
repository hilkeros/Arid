class CreateBillingAddresses < ActiveRecord::Migration
  def self.up
    create_table :billing_addresses do |t|
      t.string :firstname
      t.string :lastname
      t.string :street
      t.string :zip
      t.string :city
      t.integer :order_id
      t.string :country
      t.string :phone
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :billing_addresses
  end
end
