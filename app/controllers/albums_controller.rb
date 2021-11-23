class AlbumsController < ApplicationController
  
  before_action :set_album, only: [:edit, :update, :destroy, :show]

  def index
    @albums = Album.all
  end

  def show

  end

  def new 
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      flash[:notice] = "An album data was successfully created"
      redirect_to albums_path
    else
      flash[:error] = "There are some errors encountered"
      render :new
    end

  end

  def edit
  end

  def update
    if @album.update(album_params)
      redirect_to albums_path, notice: "An album data  was successfully updated"
    else
      flash[:error] = "There are some errors encountered"
      render :edit
    end
  end

  def destroy
    @album.destroy

    redirect_to albums_path, notice: "An album data was successfully destroyed"
  end

  private

  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:name, :released, :released_at, :cover_art_url, :kind, :length, :avatar)
  end

end