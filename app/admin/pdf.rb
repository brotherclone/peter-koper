ActiveAdmin.register Pdf do

  permit_params :memory_id, :file, :file_cache, :page_count

  form(:html => { :multipart => true }) do |f|
    f.inputs do
      f.semantic_errors *f.object.errors.attribute_names
      f.input :file, :as => :file
      f.input :file_cache, :as => :hidden
      f.input :page_count
      f.input :memory_id, :label => 'Memory', :as => :select, :collection => Memory.all.map{|a| ["#{a.title}", a.id]}
    end
    f.actions
  end

end
