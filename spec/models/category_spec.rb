require 'rails_helper'

RSpec.describe Category, type: :model do

  it 'has a valid Factory' do
    expect(build(:category)).to be_valid
  end

  it 'has a valid Factory with Memories' do
    expect(build(:category_with_memories)).to be_valid
  end

  it 'has allow for many memories' do
    should have_many(:memories)
  end


end
