require 'rails_helper'

RSpec.describe Memory, type: :model do

  it 'has a valid Factory' do
    expect(build(:memory)).to be_valid
  end

  it 'belongs to a category' do
    should belong_to(:category)
  end


end
