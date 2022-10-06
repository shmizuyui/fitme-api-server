require 'rails_helper'

RSpec.describe 'Api::V1::User::Lessons::IndexForm' do
  describe '#index' do
    let(:index_form) { Api::V1::User::Lessons::IndexForm.new(params) }

    context 'pageがある場合' do
      let(:lessons) { create_list(:lesson, 11, category: :muscle, created_at: '2022.12.12 12:12:12') }
      let(:params) { { page: 1, order: 'created_at_desc' } }

      before do
        create(:lesson, category: :yoga, created_at: '2022.12.13 12:12:12')
        lessons
      end

      it 'レッスンが10件返されること' do
        expect(index_form.index[:data][:lessons].size).to eq 10
      end

      context 'queryがある場合' do
        let(:params) { { categories: ['muscle'], page: 1, order: 'created_at_desc' } }

        it '該当するカテゴリーのレッスンのみが返されること' do
          expect(index_form.index[:data][:lessons].to_a.pluck(:category)).to eq Array.new(10, 'muscle')
        end
      end

      context 'queryがない場合' do
        it '新着順に任意のカテゴリーのレッスンが返されること' do
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
