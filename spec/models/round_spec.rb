# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Round do
  subject(:round) { create(:round) }

  describe 'associations' do
    it { is_expected.to belong_to(:tournament) }
    it { is_expected.to have_many(:round_results).dependent(:destroy) }
    it { is_expected.to have_many(:round_contests).dependent(:destroy) }
    it { is_expected.to have_many(:flights).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:date) }
    it { is_expected.to validate_length_of(:description).is_at_most(500) }
    it { is_expected.to validate_presence_of(:place) }
    it { is_expected.to validate_length_of(:place).is_at_most(255) }
    it { is_expected.to validate_presence_of(:golf_course) }
    it { is_expected.to validate_length_of(:golf_course).is_at_most(255) }
    it { is_expected.to validate_numericality_of(:num_rounds).only_integer.is_greater_than(0) }
    it { is_expected.to validate_presence_of(:num_rounds) }
    it { is_expected.to validate_length_of(:hcp).is_at_most(100) }
    it { is_expected.to validate_length_of(:criteria).is_at_most(500) }
  end
end
