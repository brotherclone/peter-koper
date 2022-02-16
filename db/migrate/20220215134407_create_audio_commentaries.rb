class CreateAudioCommentaries < ActiveRecord::Migration[6.1]
  def self.up

    create_table :audio_commentaries do |t|
      t.string :title
      t.string :file
      t.boolean :is_live
      t.timestamps
    end

    add_reference :audio_commentaries, :memory, index: true

  end

  def self.down

    remove_reference :audio_commentaries, :memory
    drop_table :audio_commentaries

  end
end
