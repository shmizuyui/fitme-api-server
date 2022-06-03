require 'rails_helper'

RSpec.describe 'Api::V1::Admin::Users::IndexForm' do
  describe '#index' do
    let(:index_form) { Api::V1::User::Lessons::IndexForm.new }

    context 'lessonが存在する場合' do
      let!(:lessons) { create_list(:lesson, 2) }

      it '正しいレスポンスが返ってくること' do
        expect(index_form.index).to eq ApiResponse.base_response(
          Api::V1::User::LessonsResponse.base_response(lessons), nil, STATUS_SUCCESS
        )
      end
    end
  end
end
