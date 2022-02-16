require 'rails_helper'

RSpec.describe AudioCommentary, type: :model do

  describe 'Factory'do
    it{ expect(build(:audio_commentary)).to be_valid }
  end

  it 'belongs to a memory' do
    should belong_to(:memory)
  end

  describe 'Must have a file' do
    it { should validate_presence_of(:file) }
  end

end
