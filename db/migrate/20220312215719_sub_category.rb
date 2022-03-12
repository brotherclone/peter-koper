class SubCategory < ActiveRecord::Migration[6.1]

  def self.up
    create_table :sub_categories do |t|
      t.string :name
      t.timestamps
    end
    add_reference :sub_categories, :category, index: true
  end

  def self.down
    remove_reference :sub_categories, :category
    drop_table :sub_categories
  end
end
