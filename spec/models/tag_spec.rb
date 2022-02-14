require 'rails_helper'

RSpec.describe Tag, type: :model do

  describe 'Factory'do
    it{ expect(build(:tag)).to be_valid }
  end

  describe 'Factory'do
    it{ expect(build(:tag_with_memories)).to be_valid }
  end

  describe 'Factory'do
    it{ expect(build(:tag_with_categories)).to be_valid }
  end

  describe 'Category Relationship' do
    it{ should have_many(:categories) }
  end

  describe 'Memory Relationship' do
    it{ should have_and_belong_to_many(:memories) }
  end

  describe 'Must have a name' do
    it { should validate_presence_of(:name) }
  end
end
