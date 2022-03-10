class RethinkVideo < ActiveRecord::Migration[6.1]

  def self.up
    remove_column :videos, :video_service
    remove_column :videos, :title
    remove_column :videos, :url
    remove_column :videos, :video_id
    add_column :videos, :file, :string
  end

  def self.down
    remove_column :videos, :file
    add_column :videos, :video_id, :string
    add_column :videos, :video_service, :string
    add_column :videos, :title, :string
    add_column :videos, :url, :string
  end

end
