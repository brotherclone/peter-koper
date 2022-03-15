require 'rails_helper'

RSpec.describe MemoryCategory, type: :model do

  describe 'Factory'do
    it{ expect(build(:memory_sub_categories)).to be_valid }
  end

  it 'belongs to a memory' do
    should belong_to(:memory)
  end

  it 'belongs to a sub category' do
    should belong_to(:sub_category)
  end

end
  