class PhotosController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  
  def index
    @user = User.find(params[:user_id])
    @photos = @user.photos.all
  end

  def show
    @user = User.find(params[:user_id])
    @photo = @user.photos.find(params[:id])
  end

  def new
    @photo = current_user.photos.new
    @gigs = Gig.past
  end

  def create
    @photo = current_user.photos.new(params[:photo])
    @photo.save!
    redirect_to user_photos_path(current_user)
  rescue ActiveRecord::RecordInvalid
    render :new
  end

  def edit
    @photo = current_user.photos.find(params[:id])
  end

  def update
    @photo = current_user.photos.find(params[:id])
    @photo.update_attributes(params[:photo])
    redirect_to user_photo_path(current_user, @photo)
  rescue ActiveRecord::RecordInvalid
    render :edit
  end

  def destroy
    @photo = current_user.photos.find(params[:id])
    @photo.destroy
    flash[:notice] = "Photo succesfully deleted"
    redirect_to user_photos_path(current_user)
  end

end
