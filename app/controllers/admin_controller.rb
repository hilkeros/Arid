class AdminController < ApplicationController
  before_filter :admin_required
  
  def admin_required
    redirect_to login_path unless current_user && current_user.admin?
  end
  
  def confirmed_orders
    @confirmed_orders = Order.confirmed.all    
  end
  helper_method :confirmed_orders
end
