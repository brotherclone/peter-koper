require 'rails_helper'

RSpec.describe MemoryCategory, type: :model do

  describe 'Factory'do
    it{ expect(build(:memory_categories)).to be_valid }
  end

end
  