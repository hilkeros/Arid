class ShippingAddressesController < ApplicationController
  
  def new
    current_order.build_shipping_address(current_order.billing_address.attributes) unless current_order.shipping_address
  end
  
  def create
    current_order.update_attributes params[:order]
    current_order.save!
    redirect_to new_order_path
  rescue ActiveRecord::RecordInvalid
    render :new
  end

end
