ActiveAdmin.register GuestBookEntry do

  permit_params :title, :body, :image_one_url, :image_one_url_cache, :image_two_url, :image_two_url_cache,
                :image_three_url, :image_three_url_cache, :guest_email, :guest_name, :challenge_passed, :admin_state


  form(:html => {:multipart => true}) do |f|
    f.inputs do
      f.input :title
      f.input :body, as: :quill_editor
      f.input :guest_name
      f.input :guest_email
      f.input :challenge_passed
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

end
