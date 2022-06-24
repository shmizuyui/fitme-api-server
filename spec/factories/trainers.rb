FactoryBot.define do
  factory :trainer do
    name { Faker::Name.name }
    name_kana { 'ナマエ カナ' }
    gender { Faker::Gender.binary_type }
    history_year { Faker::Number.number(digits: 2) }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test.jpg')) }
    message { Faker::Lorem.paragraph }
  end
end
