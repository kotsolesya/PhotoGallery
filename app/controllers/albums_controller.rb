class AlbumsController < ApplicationController
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

  def show
    @album = Album.find params[:id]
  end

  def destroy
    @album = Album.find params[:id]
    @album.destroy
  end

  private

  def album_params
    params.require(:album).permit(:title)
  end
end
