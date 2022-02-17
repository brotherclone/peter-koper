class AudioCommentariesController < ApplicationController

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Audio Commentary", :audio_commentaries_path

  before_action :set_audio_commentary, only: [:show, :edit, :update, :destroy]

  def index
    @audio_commentaries = AudioCommentary.all
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @audio_commentaries}
    end
  end

  def show
    add_breadcrumb @audio_commentary.title.to_s, audio_commentaries_path
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @audio_commentary}
    end
  end

  def new
    @audio_commentary = AudioCommentary.new
  end

  def edit

  end

  def create
    @audio_commentary = AudioCommentary.new(audio_commentary_params)
    respond_to do |format|
      if @audio_commentary.save
        format.html { redirect_to @audio_commentary, notice: 'Audio Commentary was successfully created.' }
        format.json { render :show, status: :created, location: @audio_commentary }
      else
        format.html { render :new }
        format.json { render json: @audio_commentary.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @audio_commentary.destroy
    respond_to do |format|
      format.html { redirect_to audio_commentaries_url, notice: 'Audio Commentary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_audio_commentary
    @audio_commentary = AudioCommentary.find(params[:id])
  end

  def audio_commentary_params
    params.require(:audio_commentary).permit(:is_live, :title, :file, :memory_id)
  end

end
