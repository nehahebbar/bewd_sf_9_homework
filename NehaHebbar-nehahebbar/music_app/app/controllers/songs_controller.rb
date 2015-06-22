class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = set_song
  end

  def new
    @song = Song.new
  end

  def edit
    @song = set_song
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to artist_path(@song.artist)
    else
      render "new"
    end
  end

  def update
    @song = set_song
    if @song.update(song_params)
      redirect_to song_path(@song), notice: "Song successfully updated."
    else
      render "edit"
    end
  end

  def destroy
    @song = set_song
    @song.destroy
    redirect_to songs_path
  end

  private

  def set_song
    Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :year, :artist_id, :artist)
  end


end
