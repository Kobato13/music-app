class ArtistsController < ApplicationController

  before_action :set_artist, only: [:edit, :update, :destroy, :show]

  def index
    @artists = Artist.all
  end

  def show

  end

  def new 
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      flash[:notice] = "An artist data was successfully created"
      redirect_to artists_path
    else
      flash[:error] = "There are some errors encountered"
      render :new
    end

  end

  def edit
  end

  def update
    if @artist.update(artist_params)
      redirect_to artists_path, notice: "An artist data  was successfully updated"
    else
      flash[:error] = "There are some errors encountered"
      render :edit
    end
  end

  def destroy
    @artist.destroy

    redirect_to artists_path, notice: "An artist data was successfully destroyed"
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :permalink, :bio, :formed_at, :verified, :verified_at, :avatar_url, :cover_photo_url, :avatar)
  end

end