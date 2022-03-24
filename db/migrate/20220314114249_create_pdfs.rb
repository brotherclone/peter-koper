class CreatePdfs < ActiveRecord::Migration[6.1]

  def self.up
    create_table :pdfs do |t|
      t.string :file
      t.integer :page_count
      t.timestamps
    end
    add_reference :pdfs, :memory, index: true
  end

  def self.down
    remove_reference :pdfs, :memory
    drop_table :pdfs
  end
end
