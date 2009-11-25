class UsersController < ApplicationController
  
  def new    
  end
  
  def create
    @user = User.new(params[:user])
    @user.save!
    redirect_to root_path
  rescue ActiveRecord::RecordInvalid
    render :new
  end
end
