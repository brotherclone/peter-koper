require 'rails_helper'

RSpec.describe Video, type: :model do

  describe 'Factory'do
    it{ expect(build(:video)).to be_valid }
  end

  it 'belongs to a memory' do
    should belong_to(:memory)
  end

end
