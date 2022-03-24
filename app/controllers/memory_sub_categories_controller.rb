class MemorySubCategoriesController < ApplicationController

  add_breadcrumb "Home", :root_path

  before_action :set_memory_sub_category, only: [:show, :edit, :update, :destroy]

  def index
    @memory_sub_categories = MemorySubCategory.all
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @memory_sub_categories}
    end
  end

  def show
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @memory_sub_category}
    end
  end

  def new
    @memory_sub_category = MemorySubCategory.new
  end

  def edit

  end

  def create
    @memory_sub_category = MemorySubCategory.new(memory_sub_category_params)
    respond_to do |format|
      if @memory_sub_category.save
        format.html { redirect_to @memory_sub_category, notice: 'Memory Sub Category was successfully created.' }
        format.json { render :show, status: :created, location: @memory_sub_category }
      else
        format.html { render :new }
        format.json { render json: @memory_sub_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @memory_sub_category.destroy
    respond_to do |format|
      format.html { redirect_to memory_sub_categories_url, notice: 'Memory Sub Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_memory_category
    @memory_sub_category = MemorySubCategory.find(params[:id])
  end

  def memory_category_params
    params.require(:memory_sub_category).permit(:memory_id, :sub_category_id)
  end

end
