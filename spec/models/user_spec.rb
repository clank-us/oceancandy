require 'rails_helper'

describe User do

  describe "phone validations" do
    let(:user) { Fabricate.build(:user) }
    it "validates with just 10 digits" do
      user.phone = "1234567890"
      expect(user).to be_valid

      user.phone = "123-456-7890"
      expect(user).to be_valid
    end
  end

end
