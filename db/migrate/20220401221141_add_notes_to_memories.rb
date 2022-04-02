class AddNotesToMemories < ActiveRecord::Migration[6.1]
  def self.up
    add_column :memories, :notes, :text
  end
  def self.down
    remove_column :memories, :notes
  end
end
