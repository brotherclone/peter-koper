class TagMemory < ApplicationRecord
  belongs_to :tag
  accepts_nested_attributes_for :tag, :allow_destroy => true
  belongs_to :memory
  accepts_nested_attributes_for :memory, :allow_destroy => true

  def self.ransackable_attributes(auth_object = nil)
    %w[id memory_id tag_id]
  end

end