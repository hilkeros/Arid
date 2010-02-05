class Admin::SongsController < AdminController

    def index
      @songs = Song.all
    end

    def show
      @song = Song.find(params[:id])
    end

    def new
      @song = Song.new
    end

    def create
      @song = Song.new(params[:song])
      @song.save!
      redirect_to admin_song_path(@song)
    rescue ActiveRecord::RecordInvalid
      render :new
    end

    def edit
      @song = Song.find(params[:id])
    end

    def update
      @song = Song.find(params[:id])
      @song.update_attributes!(params[:song])
      flash[:notice] = "Updated song #{@song.name}"
      redirect_to admin_songs_path
    rescue ActiveRecord::RecordInvalid
      render :edit
    end

    def destroy
      @song = Song.find(params[:id])
      @song.destroy
      flash[:notice] = "Deleted song #{@song.name}"
      redirect_to admin_songs_path
    end
  end
  