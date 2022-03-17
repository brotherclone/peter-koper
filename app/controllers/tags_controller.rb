class TagsController < ApplicationController

  add_breadcrumb "Home", :root_path

  before_action :set_tag, only: [:show]

  def index
    @tags = Tag.all.order(name: desc)
    respond_to do |format|
      format.json { render :json => @tags}
    end
  end

  def show
    if params[:category_ref]
      category = Category.find(params[:category_ref])
      if category
        add_breadcrumb  category.name.to_s, category_path(category)
        @category_ref = category
        if params[:sub_category_ref]
          sub_category = SubCategory.find(params[:sub_category_ref])
          if sub_category
            @subcategory_ref = sub_category
            add_breadcrumb  sub_category.name.to_s, [category, sub_category]
          end
        end
      end
    end
    add_breadcrumb @tag.name.to_s, tag_path(@tag)
    @show_breadcrumb = true
    @memory_tags = TagMemory.where(tag_id: @tag.id)
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @tag}
    end
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name, :category_ref, :sub_category_ref)
  end

end
