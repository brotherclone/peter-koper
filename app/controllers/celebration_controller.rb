class CelebrationController < ApplicationController

  def index
    @current = "celebration"
    @categories = Category.all.order(name: :asc)
  end

end
