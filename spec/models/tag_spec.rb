require 'rails_helper'

RSpec.describe Tag, type: :model do

  it 'has a valid Factory' do
    expect(build(:tag)).to be_valid
  end

end
