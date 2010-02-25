class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :user_id
      t.string :state
      t.decimal :price, :precision => 20, :scale => 2
      t.text :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
