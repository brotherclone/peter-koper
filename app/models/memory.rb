# app/models/memory.rb
class Memory < ApplicationRecord
  has_many :tag_memories, dependent: :destroy
  has_many :tags, through: :tag_memories
  has_many :memory_categories, dependent: :destroy
  has_many :categories, through: :memory_categories
  has_many :memory_sub_categories, dependent: :destroy
  has_many :sub_categories, through: :memory_sub_categories
  has_many :memory_comments, dependent: :destroy # Update this line
  mount_uploader :image, PhotosUploader
  enum fuzzy_date: [:regular, :month, :year, :decade, :no_show]
  validates :occurrence, presence: true
  validates :title, presence: true
  has_one :video
  has_one :pdf
  validates_size_of :image, maximum: 10.megabytes, message: "should be less than 10MB"

  def self.ransackable_attributes(auth_object = nil)
    %w[id title created_at memory_date occurrence fuzzy_date image description body_cont body_eq body_start body_end is_live_eq is_live show_title_eq notes_cont notes_eq notes_start notes_end author_name_cont author_name_eq author_name_start author_name_end author_email_cont author_email_eq author_email_start author_email_end]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[categories memory_comments memory_categories memory_sub_categories pdf sub_categories tag_memories tags video]
  end
end