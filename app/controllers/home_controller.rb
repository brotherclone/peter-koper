class HomeController < ApplicationController

  def index
    @categories = Category.all.order(name: :asc)
  end

end
