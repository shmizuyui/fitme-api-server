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

describe 'GET /api/v1/user/lessons/:id' do
  let(:lesson) { create(:lesson) }

  context '正常系' do
    before do
      get api_v1_user_lesson_path(lesson.id)
    end

    it { expect(response).to have_http_status :ok }
    it { expect(JSON.parse(response.body)['data']['lesson']['id']).to eq lesson.id }
    it { expect(JSON.parse(response.body)['data']['lesson']['title']).to eq lesson.title }
    it { expect(JSON.parse(response.body)['data']['lesson']['category']).to eq lesson.category }
    it { expect(JSON.parse(response.body)['data']['lesson']['price']).to eq lesson.price }
    it { expect(JSON.parse(response.body)['data']['lesson']['time']).to eq lesson.time }
  end

  context '異常系' do
    let(:not_exist_lesson_id) { lesson.id + 1 }

    before do
      get api_v1_user_lesson_path(not_exist_lesson_id)
    end

    it { expect(JSON.parse(response.body)['error']).to eq 'レッスンが見つかりません' }
    it { expect(JSON.parse(response.body)['status']).to eq 404 }
  end
end
