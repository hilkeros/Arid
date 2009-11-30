class AdminController < ApplicationController
  before_filter :admin_required
  
  def admin_required
    redirect_to login_path unless current_user && current_user.admin?
  end
end
