class CreateMemories < ActiveRecord::Migration[6.1]
  def self.up
    create_table :memories do |t|
      t.string :title
      t.text :body
      t.boolean :is_live
      t.string :image
      t.timestamps
    end
  end
  def self.down
    drop_table :memories
  end
end
