class AddAmountToOrders < ActiveRecord::Migration
  def self.up
    add_column :order_products, :amount, :integer, :default => 1
  end

  def self.down
    remove_column :order_products, :amount
  end
end
