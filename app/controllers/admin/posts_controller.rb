class Admin::PostsController < AdminController
  
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
    redirect_to admin_posts_path
  end

  def edit
    @post = Post.find_by_permalink!(params[:id])
  end

  def update
    @post = Post.find_by_permalink!(params[:id])
    @post.update_attributes!(params[:post])
    redirect_to admin_posts_path
  end

  def destroy
    @post = Post.find_by_permalink!(params[:id])
    @post.destroy
    flash[:notice] = "Deleted post #{@post.title}"
    redirect_to admin_posts_path
  end

end

