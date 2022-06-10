class Lesson < ApplicationRecord
  paginates_per 18

  validates :title, :price, :category, :time, presence: true

  enum category: { muscle: 1, aerobic_exercise: 2, yoga: 3, pilates: 4, stretch: 5, meal_management: 6, counseling: 7 }
end
