class TagCategoriesController < ApplicationController

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Guest Book", :tag_categories_path

  before_action :set_tag_category, only: [:show, :edit, :update, :destroy]

  def index
    @tag_categories = TagCategory.all
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @tag_categories}
    end
  end

  def show
    add_breadcrumb @tag_category.title.to_s, tag_categories_path
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @tag_category}
    end
  end

  def new
    @tag_category = TagCategory.new
  end

  def edit

  end

  def create
    @tag_category = TagCategory.new(tag_category_params)
    respond_to do |format|
      if @tag_category.save
        format.html { redirect_to @tag_category, notice: 'Tag Category was successfully created.' }
        format.json { render :show, status: :created, location: @tag_category }
      else
        format.html { render :new }
        format.json { render json: @tag_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tag_category.destroy
    respond_to do |format|
      format.html { redirect_to tag_categories_url, notice: 'Tag Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_tag_category
    @tag_category = TagCategory.find(params[:id])
  end

  def tag_category_params
    params.require(:tag_category).permit(:tag_id, :category_id)
  end

end
