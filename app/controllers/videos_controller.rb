class VideosController < ApplicationController

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Guest Book", :videos_path

  before_action :set_video, only: [:show, :edit, :update, :destroy]

  def index
    @videos = Video.all
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @videos}
    end
  end

  def show
    add_breadcrumb @video.title.to_s, videos_path
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @video}
    end
  end

  def new
    @video = Video.new
  end

  def edit
  end

  def update
    if @video.update(video_params)
      redirect_to @video
    else
      respond_to do |format|
        format.html { render :edit}
        format.json { render :json => @video}
      end
    end
  end

  def create
    @video = Video.new(video_params)
    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_video
    @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:is_live, :memory_id, :file, :file_cache)
  end

end
