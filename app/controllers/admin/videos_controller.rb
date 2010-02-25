class Admin::VideosController < AdminController
  
  def index
    @videos = Video.links.all
  end
  
  def create
    @video = Video.new(params[:video])
    @video.save!
    redirect_to admin_videos_path
  rescue ActiveRecord::RecordInvalid
    render :new
  end
  
  def show
    @video = Video.find(params[:id])
  end
  
  def edit
    @video = Video.find(params[:id])
  end
  
  def update
    @video = Video.find(params[:id])    
    @video.update_attributes(params[:video])
    redirect_to admin_videos_path
  rescue ActiveRecord::RecordInvalid
    render :new
  end
  
  def destroy
    @video= Video.find(params[:id])
    @video.destroy
    redirect_to admin_videos_path
  end
  
end
