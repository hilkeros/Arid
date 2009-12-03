class UsersController < ApplicationController
  
  def new    
  end
  
  def create
    @user = User.new(params[:user])
    @user.save!
    flash[:notice] = "Congratulations, you have succesfully registered an account."
    redirect_to root_path
  rescue ActiveRecord::RecordInvalid
    render :new
  end
end
