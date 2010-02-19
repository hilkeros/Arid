# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
    
  include ExceptionNotifiable
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user, :login_required, :upcoming_gigs
  
  before_filter :initialize_order

  def upcoming_gigs
    @gigs = Gig.upcoming.all(:limit => 4, :order => "date ASC" )
  end

  private
  def login_required
    redirect_to login_path unless current_user
  end
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end
  
  
  def initialize_order
    session[:order_id] ||= {}
  end
  
  def current_order
    @current_order ||= Order.find session[:order_id] if session[:order_id].present?
  end
  helper_method :current_order

  
end
