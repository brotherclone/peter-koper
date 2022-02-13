require 'rails_helper'

RSpec.describe Category, type: :model do

  it 'has a valid Factory' do
    expect(build(:category)).to be_valid
  end


end
