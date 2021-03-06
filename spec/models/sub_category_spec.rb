require 'rails_helper'

RSpec.describe SubCategory, type: :model do

  describe 'Factory'do
    it{ expect(build(:sub_category)).to be_valid }
  end

  describe 'Must have a name' do
    it { should validate_presence_of(:name) }
  end

  it 'belongs to a category' do
    should belong_to(:category)
  end

end
