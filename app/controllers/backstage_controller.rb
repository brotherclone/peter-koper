class BackstageController < ApplicationController
  def index
    @show_breadcrumbs = true
    add_breadcrumb "Home", :root_path
    add_breadcrumb "Back Stage", :back_stage_path
  end
  def style
    @show_breadcrumbs = true
    add_breadcrumb "Home", :root_path
    add_breadcrumb "Back Stage", :back_stage_path
    add_breadcrumb "Style Guide", :back_stage_path
  end
  def dev
    @show_breadcrumbs = true
    add_breadcrumb "Home", :root_path
    add_breadcrumb "Back Stage", :back_stage_path
    add_breadcrumb "Dev Info", :back_stage_path
  end
end
