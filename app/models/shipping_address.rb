class ShippingAddress < ActiveRecord::Base
  
  belongs_to :order
  
  validates_presence_of :firstname, :lastname, :street, :zip, :city, :country
  
  def name
    "#{lastname} #{firstname}"
  end
  
  def address
    "#{street}<br />#{zip} #{city}<br />#{country}"
  end
end
