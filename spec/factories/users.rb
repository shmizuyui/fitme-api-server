FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    name_kana { 'ナマエ フリガナ' }
    gender { 'female' }
    email { 'test@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
