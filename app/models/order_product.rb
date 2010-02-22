class OrderProduct < ActiveRecord::Base
  
  belongs_to :order
  belongs_to :product
  
  validates_numericality_of :amount, :greater_than => 0
  
  def total_price
    amount.to_f * price
  end
  
  def update_amount! amount
    case 
    when amount.to_i > 0
      update_attribute(:amount, amount.to_i)
    else
      self.destroy
    end
  end
  
end
