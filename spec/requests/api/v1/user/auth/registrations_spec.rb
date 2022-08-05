require 'rails_helper'

RSpec.describe 'Api::V1::User::Auth::Registrations', type: :request do
  describe 'POST /api/v1/user/auth' do
    before do
      post api_v1_user_user_registration_path, params:
    end

    context '新規登録ができるとき' do
      let(:params) { attributes_for(:user) }

      it { expect(response).to have_http_status :ok }
      it { expect(JSON.parse(response.body)['data']['id']).to eq User.last.id }
      it { expect(JSON.parse(response.body)['data']['name']).to eq User.last.name }
      it { expect(JSON.parse(response.body)['data']['name_kana']).to eq User.last.name_kana }
      it { expect(JSON.parse(response.body)['data']['gender']).to eq User.last.gender }
      it { expect(JSON.parse(response.body)['data']['email']).to eq User.last.email }
    end

    context '新規登録できないとき' do
      let(:params) { attributes_for(:user, password_confirmation: '') }

      it { expect(JSON.parse(response.body)['status']).to eq 'error' }
      it { expect(JSON.parse(response.body)['errors']['full_messages']).to eq ['パスワード（確認）とパスワードの入力が一致しません'] }
    end
  end

  describe 'PUT /api/v1/user/auth' do
    let(:user) { create(:user) }

    before do
      put api_v1_user_user_registration_path(user), params:, headers: headers
    end
    
    context '編集ができるとき' do
      let(:params) { {name:'名前', name_kana:'ナマエ', email:'email', password: 'passpass', password_confirmation:'passpass'} }
      let(:headers) {user.create_new_auth_token}
      
      it { expect(response).to have_http_status :ok }
      it { expect(JSON.parse(response.body)['data']['name']).to eq '名前' }


      # it 'データが更新される' do
      #   subject
      #   user.reload
      #   expect(user.name).to eq '名前'
      #   expect(user.name_kana).to eq 'ナマエ'
      #   expect(user.email).to eq 'email'
      #   expect(user.password).to eq 'passpass'
      #   expect(user.password_confirmation).to eq 'passpass'
      # end
    end
  end
end
