class Threeway < ActiveRecord::Migration[6.1]

  def self.up

    create_table :memory_categories do |t|
      t.belongs_to :memory
      t.belongs_to :category
      t.timestamps
    end

    create_table :tag_categories do |t|
      t.belongs_to :tag
      t.belongs_to :category
      t.timestamps
    end

    create_table :tag_memories do |t|
      t.belongs_to :tag
      t.belongs_to :memory
      t.timestamps
    end
  end

  def self.down
    drop_table :tag_memories
    drop_table :tag_categories
    drop_table :memory_categories
  end

end
