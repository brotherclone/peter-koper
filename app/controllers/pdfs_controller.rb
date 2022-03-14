class PdfsController < ApplicationController

  before_action :set_pdf, only: [:show, :edit, :update, :destroy]

  def index
    @pdfs = Pdf.all
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @pdfs}
    end
  end

  def show
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @pdf}
    end
  end

  def new
    @pdf = Pdf.new
  end

  def edit
  end

  def update
    if @pdf.update(pdf_params)
      redirect_to @pdf
    else
      respond_to do |format|
        format.html { render :edit}
        format.json { render :json => @pdf}
      end
    end
  end

  def create
    @pdf = Pdf.new(pdf_params)
    respond_to do |format|
      if @pdf.save
        format.html { redirect_to @pdf, notice: 'Pdf was successfully created.' }
        format.json { render :show, status: :created, location: @pdf }
      else
        format.html { render :new }
        format.json { render json: @pdf.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pdf.destroy
    respond_to do |format|
      format.html { redirect_to pdfs_url, notice: 'Pdf was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_pdf
    @pdf = Pdf.find(params[:id])
  end

  def pdf_params
    params.require(:pdf).permit(:memory_id, :file, :file_cache, :page_count)
  end

end
