FactoryGirl.define do
  
  factory :user do
    email "Jan@test.com"
    password "12345678"

    factory :user_full_profile do
      first_name "Jan"
      last_name "Boehmerman"
    end 

  end 

  factory :product do
    name "Amazingwheels"

    factory :product_full_profile do
      description "Blub"
      image_url "bike.jpg"
      colour "sparkling-pink"
      price "100" 
    end

  end

  factory :comment do # product has_many comments: each comment belongs_to a product
    body "blablub"
    rating "4"
    product
  end

  factory :order do
    user_id "1"
    product_id "1"
    total "100"
  end



end