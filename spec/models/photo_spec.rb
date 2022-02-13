require 'rails_helper'

RSpec.describe Photo, type: :model do

  it 'has a valid Factory' do
    expect(build(:photo)).to be_valid
  end

  it 'belongs to a memory' do
    should belong_to(:memory)
  end

end
