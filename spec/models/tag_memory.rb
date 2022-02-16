require 'rails_helper'

RSpec.describe TagMemory, type: :model do

  describe 'Factory'do
    it{ expect(build(:tag_memories)).to be_valid }
  end

  it 'belongs to a tag' do
    should belong_to(:tag)
  end

  it 'belongs to a memory' do
    should belong_to(:memory)
  end

end
  