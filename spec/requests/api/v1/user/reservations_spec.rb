require 'rails_helper'

RSpec.describe 'Api::V1::User::Reservations', type: :request do
  describe 'POST /api/v1/user/reservations' do
    context '正常系' do
      let(:lesson) { create(:lesson) }
      let(:user) { create(:user) }
      let(:reservation) { build(:reservation, user_id: user.id) }
      let(:params) { { lesson_id: lesson.id, start_at: reservation.start_at, user_id: reservation.user_id } }

      it 'データが作成できる' do
        expect { post '/api/v1/user/reservations', params: }.to change(Reservation, :count).by(1)
      end
    end
  end
end
