class GigsController < ApplicationController
  
  def index
    @gigs = Gig.futur.all(:order => "date ASC")
    @past_gigs = Gig.past.all(:order => "date ASC")
    respond_to do |format|
      format.html
      format.atom
    end
  end

  def show
    @gig = Gig.find_by_permalink!(params[:id])
  end
end
