class MemoryCommentsController < ApplicationController

  before_action :set_memory_comment, only: [:show, :edit, :update, :destroy]

  def index
    @memory_comments = MemoryComment.all
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @memory_comments}
    end
  end

  def show
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @memory_comment}
    end
  end

  def new
    @memory_comment = MemoryComment.new
  end

  def edit
  end

  def update
    if @memory_comment.update(memory_comment_params)
      redirect_to @memory_comment
    else
      respond_to do |format|
        format.html { render :edit}
        format.json { render :json => @memory_comment}
      end
    end
  end

  def create
    @memory_comment = MemoryComment.new(memory_comment_params)
    respond_to do |format|
      if @memory_comment.save
        format.html { redirect_to @memory_comment }
        format.json { render :show, status: :created, location: @memory_comment }
      else
        format.html { render :new }
        format.json { render json: @memory_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @memory_comment.destroy
    respond_to do |format|
      format.html { redirect_to memory_comments_url }
      format.json { head :no_content }
    end
  end

  private

  def set_memory_comment
    @memory_comment = MemoryComment.find(params[:id])
  end

  def memory_comment_params
    params.require(:memory_comment).permit(:memory_id, :author_email, :author_name, :body, :is_live)
  end

end
