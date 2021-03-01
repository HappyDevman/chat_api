require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Model relation' do
    it { is_expected.to have_many(:channels) }
    it { is_expected.to have_many(:messages) }
  end
end
