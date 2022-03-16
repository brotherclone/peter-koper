ActiveAdmin.register Category do

  permit_params :name, :image, :image_cache

  form do |f|
    f.inputs do
      f.input :name
      f.input :image, :as => :file, :label=> "1x1 Crop. Used on Home page category cards"
      f.input :image_cache, :as => :hidden
    end
    f.actions
  end

end