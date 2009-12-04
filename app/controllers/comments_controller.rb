class CommentsController < ApplicationController
  before_filter :login_required
  
  def create
    @post = Post.find_by_permalink!(params[:post_id])
    @comment = current_user.comments.new(params[:comment])
    @comment.post = @post
    @comment.save
    redirect_to post_path(@post, :anchor => "comments")
  end
end
