class FavSongsController < ApplicationController
  def index
    @fav_songs = current_user.songs.find(params[:id])
  end
  
  def show
    @fav_song = current_user.songs.find(params[:id])
  end
  
  def new
    @fav_song = current_user.songs.new(params[:fav_song])
  end

  def create
    @fav_song = current_user.songs.new(params[:fav_song])
    @fav_song.save!
    redirect_to fav_songs_path
  rescue ActiveRecord::RecordInvalid
    render :new
  end

  def edit
    @fav_song = current_user.songs.find(params[:id])
  end

  def update
    @fav_song = current_user.songs.find(params[:id])
    @fav_song.update_attributes!(params[:fav_song])
    flash[:notice] = "Updated your favorite songs"
    redirect_to fav_songs_path
  rescue ActiveRecord::RecordInvalid
    render :edit
  end

  def destroy
    @fav_song = current_user.songs.find(params[:id])
    @fav_song.destroy
    flash[:notice] = "Deleted your choices"
    redirect_to fav_songs_path
  end
end

