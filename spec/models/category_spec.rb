require 'rails_helper'

RSpec.describe Category, type: :model do

  describe 'Factory'do
    it{ expect(build(:category)).to be_valid }
  end

  describe 'Factory with memories'do
    it{ expect(build(:category_with_memories)).to be_valid }
  end

  describe 'Factory with tags'do
    it{ expect(build(:category_with_tags)).to be_valid }
  end

  describe 'Must have a name' do
    it { should validate_presence_of(:name) }
  end

  it 'has many memories through memory categories' do
    should have_many(:memory_categories)
    should have_many(:memories).through(:memory_categories)
  end

  it 'has many tags through tag categories' do
    should have_many(:tag_categories)
    should have_many(:tags).through(:tag_categories)
  end

end
