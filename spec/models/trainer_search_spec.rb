require 'rails_helper'

RSpec.describe TrainerSearch, type: :model do
  subject(:trainer_search) { described_class.new(query) }

  describe '#result' do
    subject { trainer_search.result }

    context 'categories' do
      let(:query) { { categories: [lesson.category] } }
      let(:lesson) { create(:lesson, category: :muscle, trainer: matched_trainer) }
      let(:matched_trainer) { create(:trainer) }

      before do
        create(:lesson, category: :yoga)
      end

      it { is_expected.to match_array [matched_trainer] }
    end

    context 'genders' do
      let(:query) { { genders: [matched_trainer.gender] } }
      let(:matched_trainer) { create(:trainer, gender: :male) }

      before do
        create(:trainer, gender: :female)
      end

      it { is_expected.to match_array [matched_trainer] }
    end

    context 'min_history_year' do
      let(:query) { { min_history_year: 20 } }
      let(:matched_trainer) { create(:trainer, history_year: 30) }

      before do
        matched_trainer
        create(:trainer, history_year: 10)
      end

      it { is_expected.to match_array [matched_trainer] }
    end
  end
end
