FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    name_kana { 'ナマエ フリガナ' }
    gender { 'female' }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    avatar { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test.jpg')) }
  end
end
