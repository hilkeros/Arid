class OrderProductsController < ApplicationController
  before_filter :login_required
  
  def update
    @order_product = current_order.order_products.find(params[:id])
    @order_product.update_amount!(params[:amount])
    redirect_to order_path
  end
  
  def destroy
    @order_product = current_order.order_products.find(params[:id])
    @order_product.destroy
    redirect_to order_path
  end
end
