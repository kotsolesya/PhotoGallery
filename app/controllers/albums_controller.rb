class AlbumsController < ApplicationController
  before_action :set_album, only: %i[show update edit destroy]

  def index
    @albums = Album.all
    if params[:search]
      @albums = Album.search(params[:search]).paginate(page: params[:page])
    else
      @albums = Album.paginate(page: params[:page]).order('created_at DESC')
    end
    respond_to do |format|
      format.html
      format.js { render 'album_page' }
    end
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_path(@album)
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @album.update_attributes(album_params)
      redirect_to @album
    else
      render :edit
    end
  end

  def show
  #  @album = Album.find params[:id]
  end

  def destroy
  #  @album = Album.find params[:id]
    @album.destroy
  end

  private

  def set_album
    @album ||= Album.find params[:id]
  end

  def album_params
    params.require(:album).permit(:title)
  end
end
