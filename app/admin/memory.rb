ActiveAdmin.register Memory do

  permit_params  :title, :show_title, :body, :is_live, :image, :image_cache, :occurrence, :fuzzy_date, :notes, :author_name, :author_email, category_ids:[], tag_ids:[], sub_category_ids:[]
  config.batch_actions = false


  index do
    selectable_column
    id_column
    column :title
    column :is_live
    column :occurrence
    column :author_name
    actions
  end

  index as: :grid do |memory|
    link_to image_tag(memory.image.to_s, :style => "max-width:200px; height:auto"), admin_memory_path(memory)
  end

  form do |f|
    f.inputs do
      f.semantic_errors *f.object.errors.attribute_names
      f.input :title
      f.text_area :body, :class => "tinymce", :rows => 140, :cols => 120
      f.input :is_live
      f.input :show_title
      f.input :occurrence, :as=> :date_picker
      f.input :fuzzy_date, :label=> "While all memories need dates you can use to fuzzy_date show only part of a date or no display no date at all"
      f.input :image, :as => :file, :label=> "Videos and PDF files need an image too."
      f.input :image_cache, :as => :hidden
      f.input :categories, as: :check_boxes, collection: Category.all.map { |c| [c.name, c.id] }
      f.input :sub_categories, as: :check_boxes, collection: SubCategory.all.map { |s| [s.name, s.id] }
      f.input :tags, as: :check_boxes, collection: Tag.all.map { |t| [t.name, t.id] }
      f.input :author_name, :label=> "Name of submitter that's not Rebecca :)"
      f.input :author_email, :label=> "Email of submitter"
      f.text_area :notes, :class => "tinymce", :rows => 140, :cols => 60, :label=> "Notes. These are not viewable to the public.."
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :show_title
      row :notes
      row :body
      row :categories
      row :sub_categories
      row :tags
      row :is_live
      row :author_name
      row :image do |i|
        image_tag i.image.to_s, :style => "max-width:200px; height:auto"
      end
    end
  end

end