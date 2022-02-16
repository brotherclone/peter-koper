require 'rails_helper'

RSpec.describe TagCategory, type: :model do

  describe 'Factory'do
    it{ expect(build(:tag_categories)).to be_valid }
  end

  it 'belongs to a tag' do
    should belong_to(:tag)
  end

  it 'belongs to a category' do
    should belong_to(:category)
  end


end
  