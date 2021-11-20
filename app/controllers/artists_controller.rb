class ArtistsController < ApplicationController

  before_action :set_artist, only: [:edit, :update, :destroy]

  def index
    @artist = Artist.all
  end

  def new 
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(article_params)

    if @artist.save
      flash[:notice] = "An artist data was successfully created"
      redirect_to articles_path
    else
      flash[:error] = "There are some errors encountered"
      render :new
    end

  end

  def edit
  end

  def update
    if @artist.update(artist_params)
      redirect_to artist_path, notice: "An artist data  was successfully updated"
    else
      flash[:error] = "There are some errors encountered"
      render :edit
    end
  end

  def destroy
    @artist.destroy

    redirect_to artist_path, notice: "An artist data was successfully destroyed"
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name)
  end

end