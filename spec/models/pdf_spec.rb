require 'rails_helper'

RSpec.describe Pdf, type: :model do

  describe 'Factory'do
    it{ expect(build(:pdf)).to be_valid }
  end

  it 'belongs to a memory' do
    should belong_to(:memory)
  end

end
