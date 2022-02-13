class PhotosController < ApplicationController

  before_action :set_photo, only: [:show]

  def index
    @photos = Photo.all.order(name: desc)
    respond_to do |format|
      format.json { render :json => @photos}
    end
  end

  def show
    respond_to do |format|
      format.json { render :json => @photo}
    end
  end


  private

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:memory_id, :image, :caption)
  end

end