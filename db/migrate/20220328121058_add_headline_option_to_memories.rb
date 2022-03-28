class AddHeadlineOptionToMemories < ActiveRecord::Migration[6.1]
  def self.up
    add_column :memories, :show_title, :boolean
  end
  def self.down
    remove_column :memories, :show_title
  end
end
