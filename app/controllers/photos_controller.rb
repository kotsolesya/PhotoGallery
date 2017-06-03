class PhotosController < ApplicationController
  before_action :set_album
  before_action :set_photo, only: [ :update, :edit, :destroy]
  def index
    #@photos = Photo.all
    @photos = @album.photos.all
  end

  def new
    # @photo = Photo.new
    @photo = @album.photos.new
  end

  def create
    @photo = @album.photos.new(photo_params)
    if @photo.save
      redirect_to :show
    else
      render :new
    end
  end

  def show
    @photo = @album.photos.find params[:id]
  end

  def edit
  end

  def update
    if @photo.update_attributes params[:photo]
      redirect_to :show
    else
      render :edit
    end
  end

  def destroy
     @photo.destroy
  end

  private

  def set_photo
    # @photo = Photo.find params[:id]
    @photo ||= @album.photos.find params[:id]
  end

  def set_album
    @album ||= Album.find params[:album_id]
  end

  def photo_params
    params.require(:photo).permit(:title, :description, :picture)
  end
end
