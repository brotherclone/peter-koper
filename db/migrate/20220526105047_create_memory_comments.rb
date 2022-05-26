class CreateMemoryComments < ActiveRecord::Migration[6.1]
  def self.up
    create_table :memory_comments do |t|
      t.string :author_name
      t.string :author_email
      t.text :body
      t.boolean :is_live
      t.timestamps
    end
    add_reference :memory_comments, :memory, index: :true
  end
  def self.down
    remove_reference :memory_comments, :memory
    drop_table :memory_comments
  end
end
