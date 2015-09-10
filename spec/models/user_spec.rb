require 'rails_helper'

describe User do
  context "it should return first name" do
    
    before {@user = build(:user_full_profile)}
    
    it "should return first name only" do
      expect(@user.first_name).to eq("Jan")
    end
  end

  context "user email validation" do
    before {@user = build(:user)}

    it "should validate email address" do
      expect(@user).to be_valid
    end
  end
end