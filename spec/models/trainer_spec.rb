require 'rails_helper'

RSpec.describe Trainer, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:name_kana) }
    it { is_expected.to validate_presence_of(:gender) }
  end
end
