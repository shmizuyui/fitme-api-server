require 'rails_helper'

RSpec.describe 'Api::V1::User::Lessons::IndexForm' do
  describe '#index' do
    let(:index_form) { Api::V1::User::Lessons::IndexForm.new(params) }

    context 'pageがある場合' do
      let(:lessons) { create_list(:lesson, 11, category: :muscle) }
      let(:params) { { page: 1 } }

      before do
        create(:lesson, category: :yoga)
        lessons
      end

      it 'レッスンが10件返されること' do
        expect(index_form.index[:data][:lessons].size).to eq 10
      end

      context 'queryがある場合' do
        let(:params) { { categories: ['muscle'], page: 1 } }

        it '該当するカテゴリーのレッスンのみが返されること' do
          expect(index_form.index[:data][:lessons].to_a.pluck(:category)).to eq Array.new(10, 'muscle')
        end
      end

      context 'queryがない場合' do
        it '任意のカテゴリーのレッスンが返されること' do
          expect(
            index_form.index[:data][:lessons].to_a.pluck(:category)
          ).to eq Array.new(9, 'muscle').unshift('yoga')
        end
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
