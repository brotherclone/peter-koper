class MemoriesController < ApplicationController

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Memories", :memories_path

  before_action :set_memory, only: [:show, :edit, :update, :destroy]


  def self.relevant_memories=(ids)
    @relevant_memories = ids
  end

  def self.relevant_memories
    @relevant_memories
  end

  def self.current_memory=(id)
    @current_memory = id
  end

  def self.current_memory
    @current_memory
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
    params.require(:memory).permit(:title, :body, :is_live, :image, :image_cache, :occurrence, :fuzzy_date)
  end


end
