class Lesson < ApplicationRecord
  validates :title, :category, :price, presence: true

  enum category: { muscle: 1, yoga: 2 }
end
