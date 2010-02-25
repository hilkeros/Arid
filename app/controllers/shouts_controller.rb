class ShoutsController < ApplicationController
  before_filter :login_required
  
  def create
    @shout = current_user.shouts.new(params[:shout])
    @shout.save!
    redirect_to profile_path(@shout.friend)
  rescue ActiveRecord::RecordInvalid
    flash[:error] = "Something went wrong, your shout has not been saved!"
    redirect_to profile_path(@shout.friend)
  end
  
end
