class Lesson < ApplicationRecord
  paginates_per 10

  belongs_to :trainer
  has_many :reservations, dependent: :destroy

  validates :title, :price, :category, :time, presence: true

  enum category: { muscle: 1, aerobic_exercise: 2, yoga: 3, pilates: 4, stretch: 5, meal_management: 6, counseling: 7 }
end
