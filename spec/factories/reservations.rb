FactoryBot.define do
  factory :reservation do
    start_at {'2022-12-12 12:12:12'}
    
    user
    lesson
  end
end
