require 'rails_helper'

RSpec.describe TagMemory, type: :model do

  describe 'Factory'do
    it{ expect(build(:tag_memories)).to be_valid }
  end

end
  