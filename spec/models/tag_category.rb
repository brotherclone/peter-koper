require 'rails_helper'

RSpec.describe TagCategory, type: :model do

  describe 'Factory'do
    it{ expect(build(:tag_categories)).to be_valid }
  end

end
  