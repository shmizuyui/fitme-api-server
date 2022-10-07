require 'rails_helper'

RSpec.describe 'Api::V1::User::Trainers::IndexForm' do
  describe 'index' do
    let(:index_form) { Api::V1::User::Trainers::IndexForm.new(params) }

    context 'pageがある場合' do
      let(:trainers) { create_list(:trainer, 11, gender: :male, created_at: '2022.12.12 12:12:12') }
      let(:params) { { page: 1, order: 'created_at_desc' } }

      before do
        create(:trainer, gender: :female, created_at: '2022.12.13 12:12:12')
        trainers
      end

      it 'トレーナーが10件が返されること' do
        expect(index_form.index[:data][:trainers].size).to eq 10
      end

      context 'queryがある場合' do
        let(:params) { { genders: ['male'], page: 1, order: 'created_at_desc' } }

        it '該当する性別のトレーナーのみが返されること' do
          expect(index_form.index[:data][:trainers].to_a.map { |trainer| trainer[:gender] }).to eq Array.new(10, 'male')
        end
      end

      context 'queryがない場合' do
        it '新着順に任意の性別のトレーナーが返されること' do
          expect(
            index_form.index[:data][:trainers].to_a.map { |trainer| trainer[:gender] }
          ).to eq Array.new(9, 'male').unshift('female')
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
