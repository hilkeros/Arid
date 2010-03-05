class UsersController < ApplicationController
  before_filter :login_required, :except => [:new, :create, :index]
  
  def index
    @users = scoped_users
  end

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
    @user = User.find_by_permalink(params[:id])
    @photos = @user.photos.find(:all, :limit => 10)
    @activities = @user.activities.find(:all, :limit => 20, :order => "created_at DESC")
    @shouts = @user.friend_shouts.all(:limit => 10, :order => "created_at DESC")
  end

  def update
    @user = current_user
    @user.attributes = params[:user]
    @user.save!
    flash[:notice] = "Succesfully updated settings."
    redirect_to profile_path(@user)
  rescue ActiveRecord::RecordInvalid
    render :edit
  end
  
  protected
  def scoped_users
    if params[:user_id]
      @user = User.find_by_permalink(params[:user_id])
      return @user.friends
    else
      User.all
    end
  end
end
