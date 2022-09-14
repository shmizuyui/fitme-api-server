require 'rails_helper'
RSpec.describe 'Api::V1::User::Reservations::CreateForm' do
  describe '#create' do
    let(:create_form) { Api::V1::User::Reservations::CreateForm.new(params) }

    context 'start_atがある場合' do
      let(:user) { create(:user) }
      let(:lesson) { create(:lesson) }
      let(:params) { { lesson_id: lesson.id, start_at: '2022.12.12 12:12:12', user_id: user.id } }

      it '正しいレスポンスを返すこと' do
        expect(create_form.create).to eq ApiResponse.base_response(
          Api::V1::User::ReservationsResponse.create_success(Reservation.last), nil, STATUS_SUCCESS
        )
      end
    end

    context 'start_atがない場合' do
      let(:user) { create(:user) }
      let(:lesson) { create(:lesson) }
      let(:params) { { lesson_id: lesson.id, start_at: nil, user_id: user.id } }

      it 'エラーを返すこと' do
        create_form.valid?
        expect(create_form.errors[:start_at]).to be_present
      end
    end
  end
end
