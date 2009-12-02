class Admin::GigsController < AdminController
  
  def index
    @gigs = Gig.all(:order => "date DESC")
  end
  
  def show
    @gig = Gig.find(params[:id])
    @posts = Post.all(:order => "created_at DESC")
  end
  
  def new
    @gig = Gig.new
  end

  def create
    @gig = Gig.new(params[:gig])
    @gig.save!
    redirect_to admin_gig_path(@gig)
  rescue ActiveRecord::RecordInvalid
    render :new
  end

  def edit
    @gig = Gig.find(params[:id])
  end

  def update
    @gig = Gig.find(params[:id])
    @gig.update_attributes!(params[:gig])
    flash[:notice] = "Updated gig #{@gig.venue}"
    redirect_to admin_gigs_path
  end

  def destroy
    @gig = Gig.find(params[:id])
    @gig.destroy
    flash[:notice] = "Deleted gig #{@gig.venue}"
    redirect_to admin_gigs_path
  end
end
