class CommentsController < ApplicationController
  before_filter :login_required
  
  def show
    @comment = Comment.find(params[:id])
    case 
    when @comment.post.present?   then redirect_to post_path(@comment.post, :anchor => "comments")
    when @comment.photo.present?  
      case
      when @comment.photo.user.present? then redirect_to user_photo_path(@comment.photo.user, @comment.photo, :anchor => "comments") 
      when @comment.photo.gig.present?  then redirect_to gig_photo_path(@comment.photo.gig, @comment.photo, :anchor => "comments")
      else
        redirect_to @comment.photo
      end
    when @comment.gig.present?    then redirect_to gig_path(@comment.gig, :anchor => "comments")
    else
      flash[:notice] = "Unknown comment"
      redirect_to root_path
    end
  end
  
  def create
    @comment = current_user.comments.new(params[:comment])
    @comment.save
    current_user.publish_to_facebook(:message => @comment.message, :actions_links => @comment.action_links(url_for(@comment)), :attachment => @comment.attachment(url_for(@comment))) if params[:post_to_facebook].present?
    redirect_to :back
  end
end
