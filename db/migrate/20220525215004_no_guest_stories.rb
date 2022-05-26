class NoGuestStories < ActiveRecord::Migration[6.1]
  def self.up
    remove_reference :guest_book_entries, :memory
    drop_table :guest_book_entries
    add_column :memories, :author_name, :string
    add_column :memories, :author_email, :string
  end
  def self.down
    remove_column :memories, :author_name
    remove_column :memories, :author_email
    create_table :guest_book_entries do |t|
      t.string :title
      t.text :body
      t.string :image_one_url
      t.string :image_two_url
      t.string :image_three_url
      t.string :guest_name
      t.string :guest_email
      t.integer :admin_state, :default=> 0
      t.timestamps
    end
    add_reference :guest_book_entries, :memory, index: true, null: true
  end
end
