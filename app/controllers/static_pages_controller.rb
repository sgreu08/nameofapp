class StaticPagesController < ApplicationController
  layout "static"


  def landing_page
    @featured_product = Product.first
  end
  def landing_page
    @products = Product.limit(3)
  end
end

