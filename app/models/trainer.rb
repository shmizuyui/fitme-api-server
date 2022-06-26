class Trainer < ApplicationRecord
  paginates_per 10

  has_many :lessons, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :name, :name_kana, :gender, presence: true

  enum gender: { male: 1, female: 2 }
end
