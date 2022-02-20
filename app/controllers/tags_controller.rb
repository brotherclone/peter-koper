class TagsController < ApplicationController

  before_action :set_tag, only: [:show]

  def self.current_tags=(ids)
    @current_tags = ids
  end

  def self.current_tags
    @current_tags
  end

  def self.related_tags=(ids)
    @related_tags = ids
  end

  def self.related_tags
    @related_tags
  end

  def stream
    @tags = Tag.all
  end

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
    params.require(:tag).permit(:name)
  end

end
