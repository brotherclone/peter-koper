ActiveAdmin.register Memory do

  permit_params :category_id, :title, :body, :is_live

  form do |f|
    f.inputs do
      f.input :title
      f.input :category_id, :label => 'Category', :as => :select, :collection => Category.all.map{|c| ["#{c.name}", c.id]}
      f.input :body
      f.input :is_live
    end
    f.actions
  end

end