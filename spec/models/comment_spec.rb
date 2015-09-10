require 'rails_helper'

describe Comment do 

  context "comment rating" do
    before do
      @comment = build(:comment)
    end

    it "should return the comment rating" do
      expect(@comment.rating).to eq 4
    end
  end
end