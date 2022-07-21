require 'rails_helper'

RSpec.describe 'Api::V1::Auth::Registrations', type: :request do
  describe 'POST /api/v1/user/auth' do
    context '新規登録ができるとき' do
      let(:user) { create(:user) }
      let(:params) { { name: user.name, name_kana: user.name_kana, gender: user.gender, email: user.email } }

      before do
        post api_v1_user_user_registration_path, params:
      end

      it { expect(JSON.parse(response.body)['data']['name']).to eq user.name }
      it { expect(JSON.parse(response.body)['data']['name_kana']).to eq user.name_kana }
      it { expect(JSON.parse(response.body)['data']['gender']).to eq user.gender }
      it { expect(JSON.parse(response.body)['data']['email']).to eq user.email }
    end
  end
end
