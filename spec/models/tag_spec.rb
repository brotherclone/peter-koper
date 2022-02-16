require 'rails_helper'

RSpec.describe Tag, type: :model do

  describe 'Factory'do
    it{ expect(build(:tag)).to be_valid }
  end

  describe 'Must have a name' do
    it { should validate_presence_of(:name) }
  end

  it 'has many memories through tag memories' do
    should have_many(:tag_memories)
    should have_many(:memories).through(:tag_memories)
  end

  it 'has many categories through tag categories' do
    should have_many(:tag_categories)
    should have_many(:categories).through(:tag_categories)
  end

end
