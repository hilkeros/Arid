class GigsController < ApplicationController
  
  def index
    @gigs = Gig.all
  end

  def show
    @gig = Gig.find(params[:id])
  end
end
