class TracksController < ApplicationController

  before_action :set_track, only: [:edit, :update, :destroy, :show]

  def index
    @tracks = Track.all
  end

  def show

  end

  def new 
    @track = Track.new
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      flash[:notice] = "An track data was successfully created"
      redirect_to tracks_path
    else
      flash[:error] = "There are some errors encountered"
      render :new
    end

  end

  def edit
  end

  def update
    if @track.update(track_params)
      redirect_to tracks_path, notice: "An track data  was successfully updated"
    else
      flash[:error] = "There are some errors encountered"
      render :edit
    end
  end

  def destroy
    @track.destroy

    redirect_to tracks_path, notice: "An track data was successfully destroyed"
  end

  private

  def set_track
    @track = Track.find(params[:id])
  end

  def track_params
    params.require(:track).permit(:name, :url, :credits, :available, :sound)
  end

end