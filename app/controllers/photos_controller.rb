class PhotosController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  
  def index
    @photos = scoped_photos
  end

  def show
    @photo = scoped_photos.find(params[:id])
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
  
  protected
  
  def selected_user
    @user = User.find_by_permalink(params[:user_id]) if params[:user_id].present?
  end
  
  def selected_gig
    @gig = Gig.find_by_permalink(params[:gig_id]) if params[:gig_id].present?
  end
  
  def scoped_photos
    case
    when selected_user  then selected_user.photos
    when selected_gig   then selected_gig.photos
    else
      Photo.arid
    end
  end

end
