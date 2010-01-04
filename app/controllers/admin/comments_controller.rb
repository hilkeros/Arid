class Admin::CommentsController < AdminController
  
  def index
    @comments = Comment.all
  end
  
  def show
    @comment = Comment.find(params[:id])
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Succesfully deleted comment"
    redirect_to admin_comments_path
  end

end
