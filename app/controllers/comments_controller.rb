class CommentsController < ApplicationController
  before_filter :login_required
  
  def show
    @comment = Comment.find(params[:id])
    case 
    when @comment.post.present?   then redirect_to post_path(@comment.post, :anchor => "comments")
    when @comment.photo.present?  then redirect_to user_photo_path(@comment.user, @comment.photo, :anchor => "comments")
    when @comment.gig.present?    then redirect_to gig_path(@comment.gig, :anchor => "comments")
    else
      flash[:notice] = "Unknown comment"
      redirect_to root_path
    end
  end
  
  def create
    @comment = current_user.comments.new(params[:comment])
    @comment.save
    redirect_to comment_path(@comment)
  end
end
