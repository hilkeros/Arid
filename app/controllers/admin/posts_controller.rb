class Admin::PostsController < AdminController
  
  uses_tiny_mce(:options => AppConfig.advanced_mce_options, :only => [:new, :edit])
    
  def index
    @posts = Post.all(:order => "created_at DESC")
  end

  def show
    @post = Post.find_by_permalink!(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    @post.save!
    flash[:notice] = "Succesfully created post"
    redirect_to admin_posts_path
  rescue ActiveRecord::RecordInvalid
    render :new
  end

  def edit
    @post = Post.find_by_permalink!(params[:id])
  end

  def update
    @post = Post.find_by_permalink!(params[:id])
    @post.update_attributes!(params[:post])
    flash[:notice] = "Succesfully updated post"
    redirect_to admin_posts_path
  rescue ActiveRecord::RecordInvalid
    render :edit
  end

  def destroy
    @post = Post.find_by_permalink!(params[:id])
    @post.destroy
    flash[:notice] = "Deleted post #{@post.title}"
    redirect_to admin_posts_path
  end

end

