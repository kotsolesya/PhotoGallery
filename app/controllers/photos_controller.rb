class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :update, :edit, :destroy]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to @photo
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @photo.update_attributes params[:photo]
      redirect_to @photo
    else
      render :edit
    end
  end

  def destroy
     @photo.destroy
  end

  private

  def set_photo
    @photo = Photo.find params[:id]
  end

  def photo_params
    params.require(:photo).permit(:title, :description, :picture)
  end
end
