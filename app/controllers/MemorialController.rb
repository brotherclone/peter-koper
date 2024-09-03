class MemorialController < ApplicationController

  def index
    @current = "memorial"
    @categories = Category.all.order(name: :asc)
  end

end
