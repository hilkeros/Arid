class OrderProducts < ActiveRecord::Base
  
  belongs_to :order
  belongs_to :product
  
end
