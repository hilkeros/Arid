class UserSessionsController < ApplicationController
  # skip_before_filter :login_required, :except => :destroy

  def new
    @session = UserSession.new
  end

  def create
    @session = UserSession.new(params[:user_session])
    @session.save!
    if current_user.facebook_connected?
      current_user.fill_with_facebook(facebook_session)
    end
    redirect_to root_path
  rescue Authlogic::Session::Existence::SessionInvalidError  
    render 'new'
  end

  def destroy
    current_user_session.destroy
    redirect_to root_path
  end
end
