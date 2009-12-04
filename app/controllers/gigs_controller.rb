class GigsController < ApplicationController
  
  def index
    @gigs = Gig.all
    respond_to do |format|
      format.html
      format.atom
    end
  end

  def show
    @gig = Gig.find_by_permalink!(params[:id])
  end
end
