class BillingAddressesController < ApplicationController

  def new
    current_order.build_billing_address unless current_order.billing_address
  end

  def create
    current_order.update_attributes params[:order]
    current_order.save!
    redirect_to new_shipping_addresses_path
  rescue ActiveRecord::RecordInvalid
    render :new
  end

end
