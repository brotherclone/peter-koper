class RemoveTagsFromCategories < ActiveRecord::Migration[6.1]
  def self.up
    drop_table :tag_categories
  end
  def self.down
    create_table :tag_categories do |t|
      t.belongs_to :tag
      t.belongs_to :category
      t.timestamps
    end
  end
end
