require 'rails_helper'
RSpec.describe 'Api::V1::User::Reservations::IndexForm' do
  describe '#index' do
    let(:index_form) { Api::V1::User::Reservations::IndexForm.new(params) }

    context 'user_idがある場合' do
      let(:user) { create(:user, id: 1) }
      let(:reservations) { create_list(:reservation, 2, user_id: user.id) }
      let(:params) { { user_id: reservations[0].user_id } }

      it '正しいレスポンスが返されること' do
        expect(index_form.index).to eq ApiResponse.base_response(
          Api::V1::User::ReservationsResponse.index_success(reservations), nil, STATUS_SUCCESS
        )
      end
    end

    context 'user_idがない場合' do
      let(:params) { { user_id: nil } }

      it 'エラーを返すこと' do
        index_form.valid?
        expect(index_form.errors[:user_id]).to be_present
      end
    end
  end
end
