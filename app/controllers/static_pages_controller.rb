class StaticPagesController < ApplicationController

  def landig_page
    @featured_product = Product.first
  end

end

