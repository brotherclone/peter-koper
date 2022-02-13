ActiveAdmin.register Memory do

  permit_params  :title, :body, :is_live, :image, :image_cache

  form do |f|
    f.inputs do
      f.input :title
      f.input :body
      f.input :is_live
      f.input :image, :as => :file
      f.input :image_cache, :as => :hidden
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :body
      row :category
      row :is_live
      row :image do |i|
        image_tag i.image.to_s, :style => "max-width:200px; height:auto"
      end
    end
  end

end