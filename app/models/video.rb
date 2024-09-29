class Video < ApplicationRecord
  belongs_to :memory
  accepts_nested_attributes_for :memory
  enum video_service: [:vimeo, :youtube]
  enum aspect_ratio: [:sixteen_by_nine, :nine_by_sixteen, :four_by_three]
  validates :aspect_ratio, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[id memory_id video_service aspect_ratio is_live is_live_eq created_at link_cont link_eq link_start link_end]
  end

  def self.ransackable_associations(auth_object = nil)
    ["memory"]
  end

end