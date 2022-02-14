require 'rails_helper'

RSpec.describe Memory, type: :model do

  describe 'Factory'do
    it{ expect(build(:memory)).to be_valid }
  end

  describe 'Factory with Categories'do
    it{ expect(build(:memory_with_categories)).to be_valid }
  end

  describe 'Factory with tags'do
    it{ expect(build(:memory_with_tags)).to be_valid }
  end

  describe 'Category Relationship' do
    it{ should have_and_belong_to_many(:categories) }
  end

  describe 'Tag Relationship' do
    it{ should have_and_belong_to_many(:tags) }
  end

  describe 'Must have an occurrence' do
    it { should validate_presence_of(:occurrence) }
  end

end
