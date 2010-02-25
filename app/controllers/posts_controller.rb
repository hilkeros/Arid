class PostsController < ApplicationController  
  def index
    @posts = Post.public.paginate(:all, :per_page => 10, :page => params[:page], :order => "created_at DESC")
    respond_to do |format|
      format.html
      format.atom
    end
  end

  def show
    @post = Post.public.find_by_permalink!(params[:id])
  end
end
