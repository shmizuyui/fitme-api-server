require 'rails_helper'
RSpec.describe 'Api::V1::User::Reservations::CreateForm' do
  describe '#create' do
    let(:create_form) { Api::V1::User::Reservations::CreateForm.new(params) }

    context 'パラメーターが空でない場合' do
      let(:reservation) { create(:reservation) }
      let(:params) { { lesson: lesson.id, start_at: reservation.start_at }}

      it '正しいレスポンスを返すこと' do
        expect(create_form.create).to eq ApiResponse.base_response(
          Api::V1::User::ReservationsResponse.create_success(reservation), nil, STATUS_SUCCESS
        )
      end
    end
  end
end
