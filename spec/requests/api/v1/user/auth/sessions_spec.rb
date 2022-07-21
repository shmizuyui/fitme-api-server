require 'rails_helper'

RSpec.describe 'Api::V1::Auth::Sessions', type: :request do
  describe 'POST /api/v1/user/auth/sign_in' do
    context 'ログインできるとき' do
      let(:user) { create(:user) }
      let(:params) { { email: user.email, password: user.password } }

      before do
        post api_v1_user_user_session_path, params:
      end

      it { expect(response).to have_http_status :ok }
      it { expect(response.headers['uid']).to be_present }
      it { expect(response.headers['access-token']).to be_present }
      it { expect(response.headers['client']).to be_present }
    end

    context 'ログインできないとき' do
      let(:user) { create(:user) }
      let(:params) { { email: user.email, password: 'not_matched_password' } }

      before do
        post api_v1_user_user_session_path, params:
      end

      it { expect(JSON.parse(response.body)['errors']).to eq ['ログイン用の認証情報が正しくありません。再度お試しください。'] }
      it { expect(response).to have_http_status(:unauthorized) }
    end
  end
end
