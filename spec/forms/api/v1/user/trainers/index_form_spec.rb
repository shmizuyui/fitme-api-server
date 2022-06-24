require 'rails_helper'

RSpec.describe 'Api::V1::User::Trainers::IndexForm' do
  describe 'index' do
    let(:index_form) { Api::V1::User::Trainers::IndexForm.new(params) }

    context 'pageがある場合' do
      before { create_list(:trainer, 12) }

      let(:params) { { page: 1 } }

      it '1ページ目に最初の10件が表示されること' do
        expect(index_form.index[:data][:trainers].size).to eq 10
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
