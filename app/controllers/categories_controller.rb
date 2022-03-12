class CategoriesController < ApplicationController

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Categories", :categories_path

  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @categories}
    end
  end


  def show
    add_breadcrumb @category.name.to_s, category_path
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @category}
    end
  end

  def new
    @category = Category.new
  end

  def edit

  end

  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
