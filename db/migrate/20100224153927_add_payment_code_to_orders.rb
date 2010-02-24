class AddPaymentCodeToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :payment_code, :string
  end

  def self.down
    remove_column :orders, :payment_code
  end
end
