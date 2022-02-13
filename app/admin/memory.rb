ActiveAdmin.register Memory do

  permit_params :category_id, :title, :body, :is_live, photo_attributes:[:id, :memory_id, :image, :image_cache, :caption]

  form do |f|
    f.inputs do
      f.input :title
      f.input :category_id, :label => 'Category', :as => :select, :collection => Category.all.map{|c| ["#{c.name}", c.id]}
      f.input :body
      f.input :is_live
      f.has_many :photos do |p|
        p.inputs "Photos" do
          if p.object.nil?
            p.input :destroy, :as => :boolean, :label => "Delete photo?"
          end
          p.input :image, :as => :file
          p.input :caption
          p.input :image_cache, :as => :hidden
        end
      end
    end
    f.actions
  end

end