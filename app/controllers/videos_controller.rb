class VideosController < ApplicationController
  def index
    @videos = Video.links.all
  end

  def show
    @video = Video.links.find(params[:id])
  end

end
