class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  validates :status, :start_at, presence: true

  enum status: { requested: 1, approved: 2, rejected: 3, canceled: 4 }
end
