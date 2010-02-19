class Admin::OrdersController < AdminController

  def index
    @paid_orders = Order.paid.all
    @completed_orders = Order.completed.all if params[:filter] == "archived"
  end
  
  def show
    @order = Order.find(params[:id])
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update_attributes(params[:order])
    OrderMailer.deliver_sent_order(self) if @order.paid?
    flash[:notice] = "Order succesfully updated"
    redirect_to admin_order_path(@order)
  end
  
end
