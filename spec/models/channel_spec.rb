require 'rails_helper'

RSpec.describe Channel, type: :model do
  describe 'Model relation' do
    it { is_expected.to belong_to(:owner) }
  end
end
