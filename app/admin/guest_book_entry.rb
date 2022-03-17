ActiveAdmin.register GuestBookEntry do

  permit_params :title, :body, :image_one_url, :image_one_url_cache, :image_two_url, :image_two_url_cache,
                :image_three_url, :image_three_url_cache, :guest_email, :guest_name, :admin_state


  form(:html => {:multipart => true}) do |f|
    f.inputs do
      f.input :title
      f.input :body, :input_html => { :class => 'tinymce' }
      f.input :guest_name
      f.input :guest_email
      f.input :admin_state
      f.input :image_one_url, :as => :file
      f.input :image_one_url_cache, :as => :hidden
      f.input :image_two_url, :as => :file
      f.input :image_two_url_cache, :as => :hidden
      f.input :image_three_url, :as => :file
      f.input :image_three_url_cache, :as => :hidden
    end
    f.actions
  end

  show do
    attributes_table do
      row :guest_name
      row :guest_email
      row :title
      row :body
      row :admin_state
      row :image_one_url do |a|
        image_tag a.image_one_url.to_s, :style => "max-width:200px; height:auto"
      end
      row :image_two_url do |b|
        image_tag b.image_two_url.to_s, :style => "max-width:200px; height:auto"
      end
      row :image_three_url do |c|
        image_tag c.image_three_url.to_s, :style => "max-width:200px; height:auto"
      end
    end
  end
end
