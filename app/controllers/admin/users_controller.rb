class Admin::UsersController < AdminController
  def index
    @users = User.all
  end

  def show
  end

  def edit
    @user = User.find_by_permalink(params[:id])
  end
  
  def update
    @user = User.find_by_permalink(params[:id])
    @user.update_attributes(params[:user])
    redirect_to admin_users_path
  end

end
