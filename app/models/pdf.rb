class Pdf < ApplicationRecord
  mount_uploader :file, PhotosUploader
  belongs_to :memory
  accepts_nested_attributes_for :memory
  validates_size_of :file, maximum: 100.megabytes, message: "should be less than 100MB"
  def self.ransackable_attributes(auth_object = nil)
    %w[id memory_id page_count file_cont file_eq created_at file_start file_end]
  end

  def self.ransackable_associations(auth_object = nil)
    ["memory"]
  end
end