class CategoriesController < ApplicationController

  before_action :set_category, only: [:show]

  def index
    @categories = Category.all.order(name: desc)
    respond_to do |format|
      format.json { render :json => @categories}
    end
  end

  def show
    respond_to do |format|
      format.json { render :json => @category}
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
