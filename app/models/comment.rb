# In the comments model below now 'belongs to' a Product and a User
# because of the relationship we declared in the migration:

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

# Let’s add some constraints to the comment model. 
# Because every comment record should be saved with a user ID, 
# a product ID and a message, it's a good idea to validate the presence 
# of all of those attributes 
  validates :body, presence: true
  validates :user, presence: true
  validates :product, presence: true
  validates :rating, numericality: {only_integer: true}
  
end
