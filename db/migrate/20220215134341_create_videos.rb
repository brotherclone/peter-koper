class CreateVideos < ActiveRecord::Migration[6.1]
  def self.up

    create_table :videos do |t|
      t.string :title
      t.string :url
      t.integer :video_service
      t.string :video_id
      t.boolean :is_live
      t.timestamps
    end

    add_reference :videos, :memory, index: true

  end

  def self.down

    remove_reference :videos, :memory
    drop_table :videos

  end
end
