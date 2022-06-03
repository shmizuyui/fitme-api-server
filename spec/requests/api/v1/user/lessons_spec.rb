require 'rails_helper'

describe 'GET /api/v1/user/lessons' do
  context '正常系' do
    let(:lesson) { create(:lesson) }

    before do
      lesson
      get api_v1_user_lessons_path
    end

    it { expect(response).to have_http_status :ok }
    it { expect(JSON.parse(response.body)['data']['lessons'][0]['id']).to eq lesson.id }
    it { expect(JSON.parse(response.body)['data']['lessons'][0]['title']).to eq lesson.title }
    it { expect(JSON.parse(response.body)['data']['lessons'][0]['category']).to eq lesson.category }
    it { expect(JSON.parse(response.body)['data']['lessons'][0]['price']).to eq lesson.price }
    it { expect(JSON.parse(response.body)['data']['lessons'][0]['time']).to eq lesson.time }
  end
end
