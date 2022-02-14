require 'rails_helper'

RSpec.describe Category, type: :model do

  describe 'Factory'do
    it{ expect(build(:category)).to be_valid }
  end

  describe 'Factory'do
    it{ expect(build(:category_with_memories)).to be_valid }
  end

  describe 'Factory'do
    it{ expect(build(:category_with_tags)).to be_valid }
  end

  describe 'Memory Relationship' do
    it{ should have_and_belong_to_many(:memories) }
  end

  describe 'Tag Relationship' do
    it{ should have_and_belong_to_many(:tags) }
  end

  describe 'Must have a name' do
    it { should validate_presence_of(:name) }
  end

end
