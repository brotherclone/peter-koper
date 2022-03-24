class MemoriesBelongToSubCategories < ActiveRecord::Migration[6.1]

  def self.up
    create_table :memory_sub_categories do |t|
      t.belongs_to :memory
      t.belongs_to :sub_category
      t.timestamps
    end
  end

  def self.down
    drop_table :memory_sub_categories
  end

end
