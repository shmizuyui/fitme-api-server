require 'rails_helper'

describe 'TrainerAPI' do
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
      it { expect(JSON.parse(response.body)['data']['trainers'][0]['career']).to eq trainer.career }
      it { expect(JSON.parse(response.body)['data']['trainers'][0]['image']).to eq trainer.image.url }
      it { expect(JSON.parse(response.body)['data']['trainers'][0]['message']).to eq trainer.message }
    end
  end

  describe 'GET /api/v1/user/trainers/:id' do
    let(:trainer) { create(:trainer) }

    context '正常系' do
      before do
        get api_v1_user_trainer_path(trainer.id)
      end

      it { expect(response).to have_http_status :ok }
      it { expect(JSON.parse(response.body)['data']['trainer']['id']).to eq trainer.id }
      it { expect(JSON.parse(response.body)['data']['trainer']['name']).to eq trainer.name }
      it { expect(JSON.parse(response.body)['data']['trainer']['name_kana']).to eq trainer.name_kana }
      it { expect(JSON.parse(response.body)['data']['trainer']['gender']).to eq trainer.gender }
      it { expect(JSON.parse(response.body)['data']['trainer']['history_year']).to eq trainer.history_year }
      it { expect(JSON.parse(response.body)['data']['trainer']['career']).to eq trainer.career }
      it { expect(JSON.parse(response.body)['data']['trainer']['image']).to eq trainer.image.url }
      it { expect(JSON.parse(response.body)['data']['trainer']['message']).to eq trainer.message }
      it { expect(JSON.parse(response.body)['data']['trainer']['lessons']).to eq trainer.lessons }
    end

    context '異常系' do
      let(:not_exist_trainer_id) { trainer.id + 1 }

      before do
        get api_v1_user_trainer_path(not_exist_trainer_id)
      end

      it { expect(JSON.parse(response.body)['error']).to eq 'トレーナーが見つかりません' }
      it { expect(JSON.parse(response.body)['status']).to eq 404 }
    end
  end
end
