class MemoryCategoriesController < ApplicationController

  before_action :set_memory_category, only: [:show, :edit, :update, :destroy]

  def index
    @memory_categories = MemoryCategory.all
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @memory_categories}
    end
  end

  def show
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @memory_category}
    end
  end

  def new
    @memory_category = MemoryCategory.new
  end

  def edit

  end

  def create
    @memory_category = MemoryCategory.new(memory_category_params)
    respond_to do |format|
      if @memory_category.save
        format.html { redirect_to @memory_category, notice: 'Memory Category was successfully created.' }
        format.json { render :show, status: :created, location: @memory_category }
      else
        format.html { render :new }
        format.json { render json: @memory_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @memory_category.destroy
    respond_to do |format|
      format.html { redirect_to memory_categories_url, notice: 'Memory Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_memory_category
    @memory_category = MemoryCategory.find(params[:id])
  end

  def memory_category_params
    params.require(:memory_category).permit(:memory_id, :category_id)
  end

end
