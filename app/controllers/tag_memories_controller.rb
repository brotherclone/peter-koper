class TagMemoriesController < ApplicationController

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Guest Book", :tag_memories_path

  before_action :set_tag_memory, only: [:show, :edit, :update, :destroy]

  def index
    @tag_memories = TagMemory.all
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @tag_memories}
    end
  end

  def show
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @tag_memory}
    end
  end

  def new
    @tag_memory = TagMemory.new
  end

  def edit

  end

  def create
    @tag_memory = TagMemory.new(tag_memory_params)
    respond_to do |format|
      if @tag_memory.save
        format.html { redirect_to @tag_memory, notice: 'Memory Tag was successfully created.' }
        format.json { render :show, status: :created, location: @tag_memory }
      else
        format.html { render :new }
        format.json { render json: @tag_memory.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tag_memory.destroy
    respond_to do |format|
      format.html { redirect_to tag_memories_url, notice: 'Memory Tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_tag_memory
    @tag_memory = TagMemory.find(params[:id])
  end

  def tag_memory_params
    params.require(:tag_memory).permit(:tag_id, :memory_id)
  end

end
