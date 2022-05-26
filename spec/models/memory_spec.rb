require 'rails_helper'

RSpec.describe Memory, type: :model do

  describe 'Factory'do
    it{ expect(build(:memory)).to be_valid }
  end

  describe 'Factory with tags 'do
    it{ expect(build(:memory_with_tags)).to be_valid }
  end

  describe 'Factory with categories 'do
    it{ expect(build(:memory_with_categories)).to be_valid }
  end

  describe 'Factory with sub-categories 'do
    it{ expect(build(:memory_with_sub_categories)).to be_valid }
  end

  describe 'Factory with video'do
    it{ expect(build(:memory_with_video)).to be_valid }
  end

  describe 'Factory with pdf'do
    it{ expect(build(:memory_with_pdf)).to be_valid }
  end

  describe 'Must have an occurrence' do
    it { should validate_presence_of(:occurrence) }
  end

  describe 'Must have a title' do
    it { should validate_presence_of(:title) }
  end


  it 'has one video' do
    should have_one(:video)
  end

  it 'has one video' do
    should have_one(:pdf)
  end

  it 'has many tags through tag memories' do
    should have_many(:tag_memories)
    should have_many(:tags).through(:tag_memories)
  end

  it 'has many categories through memory categories' do
    should have_many(:memory_categories)
    should have_many(:categories).through(:memory_categories)
  end

  it 'has many sub-categories through memory subcategories' do
    should have_many(:memory_sub_categories)
    should have_many(:sub_categories).through(:memory_sub_categories)
  end

end
