require 'rails_helper'

RSpec.describe LessonSearch, type: :model do
  subject(:lesson_search) { described_class.new(query) }

  describe '#result' do
    subject { lesson_search.result }

    context 'categories' do
      let(:query) { { categories: [matched_lesson.category] } }
      let(:matched_lesson) { create(:lesson, category: :muscle) }

      before do
        create(:lesson, category: :yoga)
      end

      it { is_expected.to match_array [matched_lesson] }
    end

    context 'genders' do
      let(:query) { { genders: [matched_lesson.trainer.gender] } }
      let(:matched_lesson) { create(:lesson, trainer: create(:trainer, gender: :female)) }

      before do
        create(:lesson, trainer: create(:trainer, gender: :male))
      end

      it { is_expected.to match_array [matched_lesson] }
    end

    context 'min_priice, max_price' do
      let(:query) { { min_price: 2000, max_price: 4000 } }
      let(:matched_lesson) { create(:lesson, price: 3000) }

      before do
        matched_lesson
        create(:lesson, price: 1000)
      end

      it { is_expected.to match_array [matched_lesson] }
    end
  end
end
