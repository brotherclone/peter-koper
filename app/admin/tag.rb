ActiveAdmin.register Tag do

  permit_params  :name, :category_id, :memory_id

  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end


end