class CreatePhoto < ActiveRecord::Migration[6.1]
  def self.up
    create_table :photos do |t|
      t.text :caption
      t.string :image
      t.timestamps
    end
    add_reference :photos, :memory, index: true
  end
  def self.down
    remove_reference :photos, :memory
    drop_table :photos
  end
end
