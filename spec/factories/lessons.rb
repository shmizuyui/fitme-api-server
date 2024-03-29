FactoryBot.define do
  factory :lesson do
    title { Faker::Lorem.sentence }
    price { Faker::Number.number(digits: 4) }
    category { rand(1..7) }
    time { Faker::Number.number(digits: 2) }
    content { Faker::Lorem.paragraph }

    trainer
  end
end
