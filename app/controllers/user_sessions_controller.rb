class UserSessionsController < ApplicationController
  # skip_before_filter :login_required, :except => :destroy
  
  def new
    @session = UserSession.new
  end
  
  def create
    @session = UserSession.new(params[:user_session])
    @session.save!
    redirect_back
  rescue Authlogic::Session::Existence::SessionInvalidError
    render 'new'
  end
  
  def destroy
    current_user_session.destroy
    redirect_to login_path
  end
end
