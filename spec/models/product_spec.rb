require 'rails_helper'

describe Product do
  
  context "only name present" do

    before {@product = build(:product)}

    it "returns product name" do
    expect(@product.name).to eq "Amazingwheels" 
    end
  end

  before(:all) do
    @product = build(:product_full_profile)
    @comment = build(:comment)
    # @comment = @product.comments.build(body: "blablub", rating: 4)
  end

  context "name, colour, price present" do
    it "returns name" do
      expect(@product.name).to eq "Amazingwheels"
    end

    it "returns colour" do
      expect(@product.colour).to eq "sparkling-pink"
    end

    it "returns price" do
      expect(@product.price).to eq "100"
    end

  end

  context "comment present" do
    
    it "returns comment body" do
      expect(@comment.body).to eq "blablub"
    end

    it "returns comment rating" do
      expect(@comment.rating).to eq 4
    end

    xit "returns rating of first comment" do
      expect(@product.comments.first.rating).to eq 4
    end

    # Here, I don't know how to make it count all comments.
    xit "gives correct number of comment for product" do
      expect(@product.comments.all). to eq 1
    end
  end
  
end



# look up in schema.rb

# @comment = comment.new erstellen, ein wichtiger Bestandteil, es muss zu einem Product gehören.
# Existiert der Comment? 

# HIER GEHT ES UM DIE DATENBANK

# test-driven development - zuerst den Test schreiben, dann den Code