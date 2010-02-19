class BillingAddress < ActiveRecord::Base
  
  belongs_to :order
  
  validates_presence_of :firstname, :lastname, :street, :zip, :city, :country
end