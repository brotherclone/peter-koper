ActiveAdmin.register Video do

  permit_params :is_live, :memory_id, :file, :file_cache

  form(:html => { :multipart => true }) do |f|
    f.inputs do
      f.input :file, :as => :file
      f.input :file_cache, :as => :hidden
      f.input :is_live
      f.input :memory_id, :label => 'Memory', :as => :select, :collection => Memory.all.map{|a| ["#{a.title}", a.id]}
    end
    f.actions
  end

end
