ActiveAdmin.register Video do

  permit_params :is_live, :memory_id, :link, :video_service

  form(:html => { :multipart => true }) do |f|
    f.inputs do
      f.semantic_errors *f.object.errors.attribute_names
      f.input :link, :label=> "Paste the public video link (e.g. https://vimeo.com/41621562)"
      f.input :video_service, :label=> "Which video service?"
      f.input :is_live
      f.input :memory_id, :label => 'Memory', :as => :select, :collection => Memory.all.map{|a| ["#{a.title}", a.id]}
    end
    f.actions
  end

end
