class AddAspectRatioToVideo < ActiveRecord::Migration[6.1]

  def self.up
    add_column :videos, :aspect_ratio, :integer
  end

  def self.down
    remove_column :videos, :aspect_ratio
  end

end
