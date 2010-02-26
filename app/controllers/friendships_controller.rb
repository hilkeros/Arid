class FriendshipsController < ApplicationController  
  before_filter :login_required
  
  def create  
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])  
    if @friendship.save  
      flash[:notice] = "Added friend."  
      redirect_to profile_path(@friendship.friend)  
    else  
      flash[:error] = "Error occurred when adding friend."  
      redirect_to profile_path(@friendship.friend)  
    end  
  end  
  
  def destroy  
    @friendship = current_user.friendships.find_by_friend_id(params[:id])  
    @friendship.destroy  
    flash[:notice] = "Successfully destroyed friendship."
    redirect_to profile_path(current_user)
  end  
end