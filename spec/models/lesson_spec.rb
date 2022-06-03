require 'rails_helper'

RSpec.describe Lesson, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:category) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:time) }
  end
end
