class UsersController < ApplicationController
  before_filter :login_required, :except => [:new, :create, :show]

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

  def edit
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    @user.attributes = params[:user]
    @user.save!
    flash[:notice] = "Succesfully updated settings."
    redirect_to edit_user_path
  rescue ActiveRecord::RecordInvalid
    render :edit
  end
end
