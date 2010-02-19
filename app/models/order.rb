class Order < ActiveRecord::Base
  
  has_many :order_products
  has_many :products, :through => :order_products
  has_one :billing_address
  has_one :shipping_address
  
end
