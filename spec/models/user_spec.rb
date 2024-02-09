# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  subject(:user) { create(:user) }

  describe 'associations' do
    it { is_expected.to belong_to(:academy).optional }
    it { is_expected.to belong_to(:league_registration).optional }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_length_of(:first_name).is_at_most(50) }
    it { is_expected.to validate_length_of(:last_name).is_at_most(50) }
    it { is_expected.to define_enum_for(:status).with_values(described_class.statuses) }

    context 'when phone number is improperly formatted' do
      before { user.phone = '12345' }

      it { is_expected.not_to be_valid }
    end

    context 'when polish phone number is passed without the country code' do
      before { user.phone = '123456789' }

      it { is_expected.to be_valid }
    end
  end
end
