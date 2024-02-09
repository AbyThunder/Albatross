# frozen_string_literal: true

# spec/models/league_spec.rb
require 'rails_helper'

RSpec.describe League do
  subject(:league) { create(:league) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_most(100) }
  it { is_expected.to validate_presence_of(:edition_number) }
  it { is_expected.to validate_numericality_of(:edition_number).only_integer }
  it { is_expected.to validate_presence_of(:package) }
  it { is_expected.to validate_length_of(:package).is_at_most(100) }
  it { is_expected.to validate_presence_of(:price) }
  it { is_expected.to validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
  it { is_expected.to validate_presence_of(:date) }
  it { is_expected.to validate_length_of(:classification).is_at_most(100) }

  it { is_expected.to have_many(:tournaments).dependent(:destroy) }
  it { is_expected.to have_many(:league_sponsors).dependent(:destroy) }
  it { is_expected.to have_many(:league_rewards).dependent(:destroy) }

  it {
    expect(league).to define_enum_for(:status).with_values(upcoming: 'upcoming', ongoing: 'ongoing',
                                                           completed: 'completed').backed_by_column_of_type(:string)
  }
end
