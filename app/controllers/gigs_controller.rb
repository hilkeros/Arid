class GigsController < ApplicationController
  
  def index
    @gigs = Gig.all
  end

  def show
    @gig = Gig.find(params[:id])
  end

  def new
    @gig = Gig.new
  end

  def create
    @gig = Gig.new(params[:gig])
    @gig.save!
    redirect_to @gig
  end

  def edit
    @gig = Gig.find(params[:id])
  end

  def update
    @gig = Gig.find(params[:id])
    @gig.update_attributes!(params[:gig])
    redirect_to @gig
  end

  def destroy
    @gig = Gig.find(params[:id])
    @gig.destroy
    flash[:notice] = "Deleted gig #{@gig.title}"
    redirect_to gigs_path
  end

end
