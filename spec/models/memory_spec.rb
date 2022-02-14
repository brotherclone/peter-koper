require 'rails_helper'

RSpec.describe Memory, type: :model do

  describe 'Factory'do
    it{ expect(build(:memory)).to be_valid }
  end

  describe 'Must have an occurrence' do
    it { should validate_presence_of(:occurrence) }
  end

end
