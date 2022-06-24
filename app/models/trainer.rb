class Trainer < ApplicationRecord
  paginates_per 10

  has_many :lessons, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :name, :name_kana, :gender, :history_year, :image, :message, presence: true
end
