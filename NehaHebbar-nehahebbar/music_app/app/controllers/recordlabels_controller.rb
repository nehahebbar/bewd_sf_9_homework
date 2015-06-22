class RecordlabelsController < ApplicationController
  def index
    @recordlabels = Recordlabel.all
  end

  def show
    @recordlabel = set_recordlabel
    @artists = @recordlabel.artists
  end

  def new
    @recordlabel = Recordlabel.new
  end

  def create
    @recordlabel = Recordlabel.new(recordlabel_params)
    if @recordlabel.save
      redirect_to recordlabels_index_path
    else
      render "new"
    end
  end

  def edit
    @recordlabel = set_recordlabel
  end

  def update
    @recordlabel = set_recordlabel
    if@recordlabel.update(recordlabel_params)
      redirect_to recordlabel_path(@recordlabel), notice: "Record Label successfully updated"
    else
      render "edit"
    end
  end

  def destroy
    @recordlabel = set_recordlabel
    @recordlabel.destroy
    redirect_to recordlabels_path
  end

  private

  def set_recordlabel
    Recordlabel.find(params[:id])
  end

  def recordlabel_params
    params.require(:recordlabel).permit(:name, :description, :owner)
  end

end
