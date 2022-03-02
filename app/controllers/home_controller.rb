class HomeController < ApplicationController

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


end
