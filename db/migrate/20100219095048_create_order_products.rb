class CreateOrderProducts < ActiveRecord::Migration
  def self.up
    create_table :order_products do |t|
      t.integer :order_id
      t.integer :product_id
      t.string :variant
      t.decimal :price, :precision => 20, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :order_products
  end
end
