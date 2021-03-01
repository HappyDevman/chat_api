require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'Model relation' do
    it { is_expected.to belong_to(:user) }
  end
end
