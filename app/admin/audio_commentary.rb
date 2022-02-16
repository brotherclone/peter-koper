ActiveAdmin.register AudioCommentary do

  permit_params :is_live, :title, :file, :memory_id

  form do |f|
    f.inputs do
      f.input :title
      f.input :is_live
      f.input :file, :as => :file
      f.input :memory_id, :label => 'Memory', :as => :select, :collection => Memory.all.map{|a| ["#{a.title}", a.id]}
    end
    f.actions
  end

end