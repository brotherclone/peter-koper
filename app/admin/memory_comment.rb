ActiveAdmin.register MemoryComment do

  permit_params :memory_id, :body, :author_name, :author_email, :is_live

  form(:html => { :multipart => true }) do |f|
    f.inputs do
      f.semantic_errors *f.object.errors.attribute_names
      f.input :author_name, :label=> "Name of submitter"
      f.input :author_email, :label=> "Email of submitter"
      f.text_area :body, :class => "tinymce", :rows => 140, :cols => 120
      f.input :is_live
      f.input :memory_id, :label => 'Memory', :as => :select, :collection => Memory.all.map{|a| ["#{a.title}", a.id]}
    end
    f.actions
  end

end