require 'rails_helper'

RSpec.describe Memory, type: :model do

  it 'has a valid Factory' do
    expect(build(:memory)).to be_valid
  end


end
