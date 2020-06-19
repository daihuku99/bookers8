class PhotosController < ApplicationController
  layout 'photos'
  before_action :authenticate_user!
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  def index
    @photo = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = current_user.photos.new(photo_params)
    @photo.save
    redirect_to photo_path(@photo), notice: 'You have succsessfully photo saved'
  end

  def show
  end

  def edit
  end

  def update
    if @photo.update(photo_params)
      redirect_to photo_path(@photo), notice: 'You have succsessfully photo updated'
    else
      render :edit
    end
  end

  def destroy
    if @photo.destroy
      redirect_to photos_path, notice: 'You have succsessfully photo deleted'
    else
      render :show
    end
  end

  private
  def photo_params
    params.require(:photo).permit(:title, :detail, :image, :address_city, :address_street, :prefecture, :spot)
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end
end
