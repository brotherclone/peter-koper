class BackstageController < ApplicationController
  def index
    add_breadcrumb "Home", :root_path
    add_breadcrumb "Back Stage", :back_stage_path
  end
  def styles
    add_breadcrumb "Home", :root_path
    add_breadcrumb "Style Guide", :back_stage_path
  end
  def dev
    add_breadcrumb "Home", :root_path
    add_breadcrumb "Dev Info", :back_stage_path
  end
end
