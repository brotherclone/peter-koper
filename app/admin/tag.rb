ActiveAdmin.register Tag do

  permit_params :name

  form do |f|
    f.inputs do
      f.semantic_errors *f.object.errors.attribute_names
      f.input :name
    end
    f.actions
  end


end