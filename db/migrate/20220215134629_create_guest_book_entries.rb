class CreateGuestBookEntries < ActiveRecord::Migration[6.1]
  def self.up

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


  end

  def self.down

    drop_table :guest_book_entries

  end
end
