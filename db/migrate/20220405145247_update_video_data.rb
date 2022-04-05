class UpdateVideoData < ActiveRecord::Migration[6.1]
  def self.up
    remove_column :videos, :file
    add_column :videos, :link, :string
    add_column :videos, :video_service, :integer
  end
  def self.down
    remove_column :videos, :link
    remove_column :videos, :video_service
    add_column :videos, :file, :string
  end
end
