FactoryBot.define do
  factory :reservation do
    start_at { '2022-12-12 12:12:12' }
    status { rand(1..4) }

    user
    lesson
  end
end
