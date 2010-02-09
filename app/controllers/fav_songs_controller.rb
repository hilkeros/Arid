class FavSongsController < ApplicationController
  def index
    @fav_songs = current_user.songs
  end
  
  def show
    @fav_songs = current_user.songs.all
  end

  def edit
    @songs = Song.all
    @fav_songs = current_user.fav_songs
    @user_songs = current_user.songs
  end

  def update
    @user = current_user
    @user.update_favorite_songs(params[:user][:fav_songs])
    flash[:notice] = "Updated your favorite songs"
    redirect_to profile_path(current_user)
  rescue ActiveRecord::RecordInvalid
    render :edit
  end

end

