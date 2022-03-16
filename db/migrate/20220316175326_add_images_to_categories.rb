class AddImagesToCategories < ActiveRecord::Migration[6.1]
  def self.up
    add_column :categories, :image, :string
  end
  def self.down
    remove_column :categories, :image
  end
end
