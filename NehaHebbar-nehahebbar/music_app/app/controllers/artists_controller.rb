class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def show
    @artist = set_artist
    @songs = @artist.songs
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artists_index_path
    else
      render "new"
    end
  end

  def edit
    @artist = set_artist
  end

  def update
    @artist = set_artist
    if@artist.update(artist_params)
      redirect_to artist_path(@artist), notice: "Artist successfully updated"
    else
      render "edit"
    end
  end

  def destroy
    @artist = set_artist
    @artist.destroy
    redirect_to artists_path
  end

  private
  def set_artist
    Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :recordlabel_id, :recordlabel)
  end

end
