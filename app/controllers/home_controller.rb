class HomeController < ApplicationController

  def index
    @current = "home"
    @categories = Category.all.order(name: :asc)
  end

end
