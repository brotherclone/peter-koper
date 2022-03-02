class HomeController < ApplicationController

  def index
    @memories = Memory.all
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @memories}
    end
  end


end
