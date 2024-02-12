# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tournament do
  subject(:tournament) { create(:tournament) }

  describe 'associations' do
    it { is_expected.to belong_to(:league) }
    it { is_expected.to have_many(:rounds).dependent(:destroy) }
    it { is_expected.to have_many(:tournament_results).dependent(:destroy) }
    it { is_expected.to have_many(:tournament_rewards).dependent(:destroy) }
    it { is_expected.to have_many(:tournament_sponsors).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(100) }
    it { is_expected.to validate_presence_of(:date) }
    it { is_expected.to validate_presence_of(:place) }
    it { is_expected.to validate_presence_of(:num_rounds) }
    it { is_expected.to validate_numericality_of(:num_rounds).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_presence_of(:cost) }
    it { is_expected.to validate_numericality_of(:cost).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_length_of(:formula).is_at_most(100) }
    it { is_expected.to validate_length_of(:package).is_at_most(255) }
    it { is_expected.to validate_length_of(:time).is_at_most(100) }
    it { is_expected.to validate_length_of(:gen_classification).is_at_most(100) }
    it { is_expected.to validate_presence_of(:min_players) }
    it { is_expected.to validate_numericality_of(:min_players).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_presence_of(:max_players) }
    it { is_expected.to validate_numericality_of(:max_players).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_presence_of(:holes) }
    it { is_expected.to validate_numericality_of(:holes).is_greater_than(0) }
    it { is_expected.to validate_length_of(:hcp).is_at_most(50) }
  end

  describe 'enums' do
    it do
      expect(tournament).to define_enum_for(:status)
        .with_values(upcoming: 'upcoming', ongoing: 'ongoing', completed: 'completed')
        .backed_by_column_of_type(:string)
    end
  end
end
