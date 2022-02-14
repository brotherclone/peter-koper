require 'rails_helper'

RSpec.describe Category, type: :model do

  describe 'Factory'do
    it{ expect(build(:category)).to be_valid }
  end

  describe 'Must have a name' do
    it { should validate_presence_of(:name) }
  end

end
