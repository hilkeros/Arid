class GigsController < ApplicationController
  
  def index
    @gigs = Gig.all
  end

  def show
    @gig = Gig.find_by_permalink!(params[:id])
  end
end
