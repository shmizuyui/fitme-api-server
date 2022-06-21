require 'rails_helper'

RSpec.describe 'Api::V1::User::Lessons::IndexForm' do
  describe '#index' do
    let(:index_form) { Api::V1::User::Lessons::IndexForm.new(params) }

    context 'pageがある場合' do
      let!(:lessons) { create_list(:lesson, 12) }
      let(:params) { { page: 1 } }

      it '1ページ目に最初の10件が表示されること' do
        expect(index_form.index).to eq ApiResponse.base_response(
          Api::V1::User::LessonsResponse.index_success(lessons.first(10)), nil, STATUS_SUCCESS
        )
      end
    end

    context 'pageがない場合' do
      let(:params) { { page: nil } }

      it 'エラーを返すこと' do
        index_form.valid?
        expect(index_form.errors[:page]).to be_present
      end
    end
  end
end
