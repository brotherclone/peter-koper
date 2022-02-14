class CreateTag < ActiveRecord::Migration[6.1]
  def self.up

    create_table :tags do |t|
      t.string :name
      t.timestamps
    end

    create_table :memories_tags do |t|
      t.belongs_to :tag
      t.belongs_to :memory
    end

    create_table :categories_tags do |t|
      t.belongs_to :tag
      t.belongs_to :category
    end

  end

  def self.down
    drop_table :categories_tags
    drop_table :memories_tags
    drop_table :tags
  end
end
