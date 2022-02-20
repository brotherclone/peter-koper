ActiveAdmin.register Category do

  permit_params :name, tag_ids:[]

  form do |f|
    f.inputs do
      f.input :name
      f.input :tags, as: :check_boxes, collection: Tag.all.map { |t| [t.name, t.id] }
    end
    f.actions
  end

end