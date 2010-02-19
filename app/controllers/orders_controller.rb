class OrdersController < ApplicationController
  
  def show
    @order = current_order
  end  
  
  def new
    @order = current_order
  end
  
  def update
    @order = current_order
    @order.update_attributes(params[:order])
    @order.confirm!
    redirect_to confirmed_order_path
  end
  
  def confirmed
    @order = current_order
    session[:order_id] = nil
  end
end
