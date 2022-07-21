# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  validates :name, :gender, :email, :name_kana, presence: true

  enum gender: { male: 1, female: 2 }
end
