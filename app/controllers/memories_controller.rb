class MemoriesController < ApplicationController

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Memories", :memories_path

  before_action :set_memory, only: [:show, :edit, :update, :destroy]

  def self.category_stream=(categories)
    @category_stream = categories
  end

  def self.category_stream
    @category_stream
  end

  def self.tag_stream=(tags)
    @tag_stream = tags
  end

  def self.tag_stream
    @tag_stream
  end


  def stream_nav
    if params[:viewing]
      viewing = params[:viewing]
      viewing_categories = MemoryCategory.where(memory_id: viewing)
      viewing_tags = TagMemory.where(memory_id: viewing)
      tag_categories = TagCategory.where(category_id: viewing_categories)
      viewing_categories_ids = []
      viewing_tags_ids =[]
      viewing_categories.each do |c|
        viewing_categories_ids << c.category_id
      end
      viewing_tags.each do |t|
        viewing_tags_ids << t.tag_id
      end
      tag_categories.each do |tc|
        viewing_tags_ids << tc.tag_id
      end
      MemoriesController.category_stream = Category.where(id: viewing_categories_ids)
      MemoriesController.tag_stream = Tag.where(id: viewing_tags_ids)
    end
  end

  def stream
    if params[:remembering]
      remembering = params[:remembering]
      remembering_memories = MemoryCategory.where(category_id: remembering)
      if remembering_memories
        stream_category = Category.find(remembering)
        @stream_name = stream_category.name
        remembering_ids = []
        remembering_memories.each do |r|
          remembering_ids << r.memory_id
        end
        @memories = Memory.where(id: remembering_ids)
      end
    elsif params[:pondering]
      pondering = params[:pondering]
      pondering_memories = TagMemory.where(tag_id: pondering)
      if pondering_memories
        stream_tag = Tag.find(pondering)
        @stream_name = stream_tag.name
        pondering_ids = []
        pondering_memories.each do |p|
          pondering_ids << p.memory_id
        end
        @memories = Memory.where(id: pondering_ids)
      end
    end
    unless @memories
      @memories = Memory.all.order(occurrence: :desc).where(is_live:true)
    end
  end

  def index
    @memories = Memory.all
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @memories}
    end
  end


  def show
    add_breadcrumb @memory.title.to_s, memory_path
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
    params.require(:memory).permit(:title, :body, :is_live, :image, :image_cache, :occurrence, :fuzzy_date, :viewing)
  end


end
