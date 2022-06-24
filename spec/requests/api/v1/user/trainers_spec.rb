require 'rails_helper'

describe 'GET /api/v1/user/trainers' do
  context '正常系' do
    let(:trainer) { create(:trainer) }
    let(:params) { { page: 1 } }

    before do
      trainer
      get api_v1_user_trainers_path, params:
    end

    it { expect(response).to have_http_status :ok }
    it { expect(JSON.parse(response.body)['data']['trainers'][0]['id']).to eq trainer.id }
    it { expect(JSON.parse(response.body)['data']['trainers'][0]['name']).to eq trainer.name }
    it { expect(JSON.parse(response.body)['data']['trainers'][0]['name_kana']).to eq trainer.name_kana }
    it { expect(JSON.parse(response.body)['data']['trainers'][0]['gender']).to eq trainer.gender }
    it { expect(JSON.parse(response.body)['data']['trainers'][0]['history_year']).to eq trainer.history_year }
    it { expect(JSON.parse(response.body)['data']['trainers'][0]['image']).to eq trainer.image.url }
    it { expect(JSON.parse(response.body)['data']['trainers'][0]['message']).to eq trainer.message }
  end
end
