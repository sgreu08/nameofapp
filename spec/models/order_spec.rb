require 'rails_helper'

describe Order do
  
  context "user_id" do
    before {@order = build(:order)}

    it "should return the user id" do
      expect(@order.user_id).to eq(1)
    end
  end
  
end