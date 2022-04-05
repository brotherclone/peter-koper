class MemoriesController < ApplicationController

  add_breadcrumb "Home", :root_path

  before_action :set_memory, only: [:show, :edit, :update, :destroy]

  def index
    @memories = Memory.all
    @memories.each do |memory|
      if memory.show_title != true and memory.title.length > 1
        memory.show_title = true
        memory.save
      end
    end
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @memories}
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

    if  @memory.title
      add_breadcrumb @memory.title.to_s, memory_path
    end
    @stories = GuestBookEntry.where(memory_id: @memory.id)

    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @memory}
    end
  end

  def new
    @memory = Memory.new
  end

  def edit

  end

  def create
    @memory = Memory.new(memory_params)
    respond_to do |format|
      if @memory.save
        format.html { redirect_to @memory, notice: 'Memory was successfully created.' }
        format.json { render :show, status: :created, location: @memory }
      else
        format.html { render :new }
        format.json { render json: @memory.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @memory.update(memory_params)
        format.html { redirect_to @memory, notice: 'Memory was successfully updated.' }
        format.json { render :show, status: :ok, location: @memory }
      else
        format.json { render json: @memory.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @memory.destroy
    respond_to do |format|
      format.html { redirect_to memories_url, notice: 'Memory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_memory
    @memory = Memory.find(params[:id])
  end

  def memory_params
    params.require(:memory).permit(:title, :show_title, :body, :is_live, :image, :image_cache, :occurrence, :fuzzy_date, :viewing, :notes)
  end

end
