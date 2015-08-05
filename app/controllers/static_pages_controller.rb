class StaticPagesController < ApplicationController
  
  def landing_page
    @featured_product = Product.first
    # Display three products from your database
    @products = Product.limit(3)

    @products = Product.all
    # Define Counter Variable which is needed for automatically adopting the number of buttons to the number of slides on the landing page
      @counter = Product.count  
      @product = Product.new
  end 

  def index
  end

  def about
  end

  def contact
  end
end
