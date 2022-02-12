class MemoriesController < InheritedResources::Base

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Memories", :memories_path

  before_action :set_memory, only: [:show, :edit, :update, :destroy]

  def index
    @memories = Memory.all.order(occurance: :desc).where(is_live: true)
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
    @album = Memory.new
  end

  def edit

  end

  def create
    @memory = Memory.new(memory_params)
    respond_to do |format|
      if @album.save
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
    params.require(:memory).permit(:title, :category_id, :is_live, :body)
  end


end
