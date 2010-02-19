class Order < ActiveRecord::Base
  
  has_many :order_products
  has_many :products, :through => :order_products
  has_one :billing_address
  has_one :shipping_address
  
  accepts_nested_attributes_for :billing_address
  accepts_nested_attributes_for :shipping_address
  
  state_machine :state, :initial => :created do 
    event :confirm do
      transition :created => :confirmed
    end
    
    event :payed do
      transition :confirmed => :payed
    end
    
    event :sent do
      transition :payed => :sent
    end
    
    after_transition :on => :confirm, :do => :new_order_mail
    # after_transition :on => :sent, :do => :delivery_mail
  end
  
  def total_price
    order_products.sum(:price)
  end
  
  def new_order_mail
    OrderMailer.deliver_new_order(self)
    OrderMailer.deliver_confirmed(self)
  end
  
end
