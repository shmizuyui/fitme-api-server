require 'rails_helper'

RSpec.describe 'Api::V1::User::Reservations', type: :request do
  describe 'GET /api/v1/user/reservations' do
    context '正常系' do
      let(:reservation) { create(:reservation) }
      let(:params) { { user_id: reservation.user_id } }

      before do
        reservation
        get api_v1_user_reservations_path, params:
      end

      it { expect(response).to have_http_status :ok }
      it { expect(JSON.parse(response.body)['data']['reservations'][0]['id']).to eq reservation.id }

      it {
        expect(
          JSON.parse(response.body)['data']['reservations'][0]['start_at']
        ).to eq (reservation.start_at).strftime('%Y-%m-%dT%H:%M:%S.000+09:00')
      }

      it { expect(JSON.parse(response.body)['data']['reservations'][0]['status']).to eq reservation.status }
      it { expect(JSON.parse(response.body)['data']['reservations'][0]['lesson']['time']).to eq reservation.lesson.time }
      it { expect(JSON.parse(response.body)['data']['reservations'][0]['lesson']['title']).to eq reservation.lesson.title }

      it {
        expect(
          JSON.parse(response.body)['data']['reservations'][0]['lesson']['trainer']['name']
        ).to eq reservation.lesson.trainer.name
      }
    end
  end

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
