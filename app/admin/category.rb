ActiveAdmin.register Category do

  permit_params :name, :tag_id, :memory_id, tag_attributes:[:id, :name, :category_id, :memory_id, :_delete]

  form do |f|
    f.inputs do
      f.input :name
      f.inputs do
        f.has_many :tags, heading: "Tags", allow_destroy: true, new_record: true do |s|
          s.input :id, :label => 'Tag', :as => :select, :collection => Tag.all.map{|a| ["#{a.name}", a.id]}
        end
      end
    end
    f.actions
  end

end