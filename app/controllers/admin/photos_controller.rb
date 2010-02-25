class Admin::PhotosController < AdminController
  
  def index
    @photos = Photo.arid.all
    @user_photos = Photo.users.all
  end
  
  def create
    @photo = Photo.new(params[:photo])
    @photo.save!
    redirect_to admin_photos_path
  rescue ActiveRecord::RecordInvalid
    render :new
  end
  
  def show
    @photo = Photo.find(params[:id])
  end
  
  def edit
    @photo = Photo.find(params[:id])
  end
  
  def update
    @photo = Photo.find(params[:id])    
    @photo.update_attributes(params[:photo])
    redirect_to admin_photos_path
  rescue ActiveRecord::RecordInvalid
    render :new
  end
  
  def destroy
    @photo= Photo.find(params[:id])
    @photo.destroy
    redirect_to admin_photos_path
  end
  
end
