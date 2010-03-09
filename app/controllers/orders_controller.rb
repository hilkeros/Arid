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
    current_user.publish_to_facebook(:message => @order.message, :actions_links => @order.action_links(products_url), :attachment => @order.attachment(product_url(@order.products.first))) if params[:post_to_facebook] == "yes"
    redirect_to confirmed_order_path
  end
  
  def confirmed
    @order = current_order
    session[:order_id] = nil
  end
end
