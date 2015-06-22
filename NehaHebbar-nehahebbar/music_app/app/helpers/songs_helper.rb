module SongsHelper

  def artist_name
    if params[:artist]
      artist = Artist.find(params[:artist])
      "#{artist.name}"
    else
     "Error - need to fix"
    end
  end
end
