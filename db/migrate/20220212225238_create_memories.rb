class CreateMemories < ActiveRecord::Migration[6.1]
  def self.up
    create_table :memories do |t|
      t.string :title
      t.boolean :is_live
      t.text :body
      t.string :image
      t.timestamps
    end
    add_reference :memories, :category, index: true
  end
  def self.down
    remove_reference :memories, :category
    drop_table :memories
  end
end
