class OrderProduct < ActiveRecord::Base
  
  belongs_to :order
  belongs_to :product
  
  def total_price
    amount.to_f * price
  end
  
end
