FactoryBot.define do
  factory :product do
<<<<<<< Updated upstream
    
  end
end
=======
    association :user

    name { Faker::Name.name }
    explanation { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 1, to: 10) }
    condition_id { Faker::Number.between(from: 1, to: 6) }
    postage_type_id { Faker::Number.between(from: 1, to: 2) }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    preparation_day_id { Faker::Number.between(from: 1, to: 3) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

>>>>>>> Stashed changes
