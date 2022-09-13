require 'rails_helper'

RSpec.describe "Api::V1::User::Reservations", type: :request do
  describe "POST /api/v1/user/reservations" do
    context '正常系' do
      let(:reservation) { create(:reservation) }
      let(:params) { { lesson: lesson, start_at: reservation.start_at } }

      before do
        reservation
        post api_v1_user_reservations_path, params:
      end
      it { expect(response).to have_http_status :ok }
      it { expect(JSON.parse(response.body)['data']['reservation']['id']).to eq reservation.id }
      it { expect(JSON.parse(response.body)['data']['reservation']['start_at']).to eq reservation.start_at }
    end
  end
end