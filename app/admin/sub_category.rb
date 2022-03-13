ActiveAdmin.register SubCategory do

  permit_params :name, :category_id

  form do |f|
    f.inputs do
      f.input :name
      f.input :category_id, :label => 'Category', :as => :select, :collection => Category.all.map{|c| ["#{c.name}", c.id]}
    end
    f.actions
  end

end