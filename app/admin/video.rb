ActiveAdmin.register Video do

  permit_params :is_live, :title, :url, :video_service, :video_id, :memory_id

  form(:html => { :multipart => true }) do |f|
    f.inputs do
      f.input :title
      f.input :url
      f.input :video_service
      f.input :video_id
      f.input :memory_id, :label => 'Memory', :as => :select, :collection => Memory.all.map{|a| ["#{a.title}", a.id]}
    end
    f.actions
  end

end
