class Lesson < ApplicationRecord
  validates :title, :price, :category, :time, presence: true

  enum category: { muscle: 1, yoga: 2 }
end
