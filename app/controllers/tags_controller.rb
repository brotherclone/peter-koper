class TagsController < ApplicationController

  before_action :set_tag, only: [:show]

  def index
    @tags = Tag.all.order(name: desc)
    respond_to do |format|
      format.json { render :json => @tags}
    end
  end

  def show
    respond_to do |format|
      format.json { render :json => @tag}
    end
  end


  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name, :memory_id, :category_id)
  end

end
