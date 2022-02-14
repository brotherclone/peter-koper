require 'rails_helper'

RSpec.describe Tag, type: :model do

  describe 'Factory'do
    it{ expect(build(:tag)).to be_valid }
  end

  describe 'Must have a name' do
    it { should validate_presence_of(:name) }
  end
end
