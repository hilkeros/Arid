class GigsController < ApplicationController
  
  def index
    @gigs = Gig.futur
    @past_gigs = Gig.past
    respond_to do |format|
      format.html
      format.atom
    end
  end

  def show
    @gig = Gig.find_by_permalink!(params[:id])
  end
end
