require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:start_at) }
  end
end
