require 'rails_helper'

RSpec.describe 'Api::V1::User::Lessons::ShowForm' do
  describe '#show' do
    let(:show_form) { Api::V1::User::Lessons::ShowForm.new(params) }

    context 'idがない場合' do
      let(:params) { { id: nil } }

      it 'エラーを返すこと' do
        show_form.valid?
        expect(show_form.errors[:id]).to be_present
      end
    end
  end
end
