class CreateCategory < ActiveRecord::Migration[6.1]
  def self.up

    create_table :categories do |t|
      t.string :name
      t.timestamps
    end

    create_table :categories_memories do |t|
      t.belongs_to :memory
      t.belongs_to :category
    end

  end

  def self.down
    drop_table :categories_memories
    drop_table :categories
  end

end
