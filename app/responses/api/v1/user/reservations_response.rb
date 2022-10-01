class Api::V1::User::ReservationsResponse
  class << self
    def create_success(reservation)
      {
        reservation: build_reservation(reservation)
      }
    end

    def index_success(reservations)
      {
        reservations: reservations.map { |reservation| build_reservation(reservation) }
      }
    end

    private

    def build_reservation(reservation)
      {
        id: reservation.id,
        start_at: reservation.start_at,
        status: reservation.status,
        lesson: build_lesson(reservation.lesson)
      }
    end

    def build_lesson(lesson)
      {
        time: lesson.time,
        title: lesson.title,
        trainer: build_trainer(lesson.trainer)
      }
    end

    def build_trainer(trainer)
      {
        name: trainer.name
      }
    end
  end
end
