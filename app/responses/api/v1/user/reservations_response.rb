class Api::V1::User::ReservationsResponse
  class << self
    def create_success(reservation)
      {
        reservation: build_reservation(reservation)
      }
    end

    private

    def build_reservation(reservation)
      {
        id: reservation.id,
        start_at: reservation.start_at
      }
    end
  end
end
