class Order < ActiveRecord::Base
  
  has_many :order_products
  has_many :products, :through => :order_products
  has_one :billing_address
  has_one :shipping_address
  belongs_to :user
  
  accepts_nested_attributes_for :billing_address
  accepts_nested_attributes_for :shipping_address
  
  named_scope :confirmed, :conditions => { :state => "confirmed" }
  named_scope :paid, :conditions => { :state => "paid" }
  named_scope :completed, :conditions => { :state => "sent" }
  
  state_machine :state, :initial => :created do 
    event :confirm do
      transition :created => :confirmed
    end
    
    event :paid do
      transition :confirmed => :paid
    end
    
    event :sent do
      transition :payed => :sent
    end
    
    after_transition :on => :confirm, :do => :new_order_mail
  end
  
  def total_price
    price = 0.0
    order_products.each do |order_product|
      price += order_product.total_price
    end
    return price
  end
  
  def new_order_mail
    OrderMailer.deliver_new_order(self)
    OrderMailer.deliver_confirmed(self)
  end
  
end
