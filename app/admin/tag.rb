ActiveAdmin.register Tag do

  permit_params :name, category_ids:[]

  form do |f|
    f.inputs do
      f.input :name
      f.input :categories, as: :check_boxes, collection: Category.all.map { |t| [t.name, t.id] }
    end
    f.actions
  end


end