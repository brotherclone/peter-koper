require 'rails_helper'

RSpec.describe Video, type: :model do

  describe 'Factory'do
    it{ expect(build(:video)).to be_valid }
  end

end
