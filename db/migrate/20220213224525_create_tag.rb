class CreateTag < ActiveRecord::Migration[6.1]
  def self.up
    create_table :tags do |t|
      t.string :name
      t.timestamps
    end
    create_table :tags_memories do |t|
      t.belongs_to :tag
      t.belongs_to :memory
    end
  end
  def self.down
    drop_table :tags_memories
    drop_table :tags
  end
end
