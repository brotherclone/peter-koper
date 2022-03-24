class SubCategoriesController < ApplicationController

  add_breadcrumb "Home", :root_path

  before_action :get_category
  before_action :set_sub_category, only: [:show, :edit, :update, :destroy]

  def index
    @sub_categories = @category.sub_categories
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @sub_categories}
    end
  end

  def show
    @show_breadcrumbs = true
    @memory_sub_categories = MemorySubCategory.where(sub_category_id: @sub_category.id)
    add_breadcrumb @category.name.to_s, category_path(@category)
    add_breadcrumb  @sub_category.name.to_s, [@category, @sub_category]
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @sub_category}
    end
  end

  def new
    @sub_category = @category.sub_categories.build
  end

  def edit

  end

  def create
    @sub_category = @category.sub_categories.build(sub_category_params)
    respond_to do |format|
      if @sub_category.save
        format.html { redirect_to category_sub_categories_path(@category), notice: 'Sub-Category was successfully created.' }
        format.json { render :show, status: :created, location: @sub_category }
      else
        format.html { render :new }
        format.json { render json: @sub_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @sub_category.update(sub_category_params)
        format.html { redirect_to @sub_category, notice: 'Sub-Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_category }
      else
        format.json { render json: @sub_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sub_category.destroy
    respond_to do |format|
      format.html { redirect_to category_sub_categories_path, notice: 'Sub Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_sub_category
    @sub_category = @category.sub_categories.find(params[:id])
  end

  def get_category
    @category = Category.find(params[:category_id])
  end

  def sub_category_params
    params.require(:sub_category).permit(:name, :category_id)
  end

end
