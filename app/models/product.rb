
class Product < ActiveRecord::Base
  has_many :orders
  has_many :comments

  def average_rating
          comments.average(:raiting).to_f
  end
# Let's add a validation to the Product model that requires all new products
# to have a name provided.
  validates :name, presence: true

  
end


