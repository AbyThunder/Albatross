# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Academy do
  subject(:academy) do
    described_class.new(name: 'Valid Academy Name',
                        season: '2023 Spring',
                        package: 'Standard Package',
                        edition_number: 'Edition 1',
                        status: 'upcoming')
  end

  # Test for presence
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:season) }
  it { is_expected.to validate_presence_of(:package) }
  it { is_expected.to validate_presence_of(:edition_number) }

  # Test for maximum length
  it { is_expected.to validate_length_of(:name).is_at_most(100) }
  it { is_expected.to validate_length_of(:season).is_at_most(100) }
  it { is_expected.to validate_length_of(:package).is_at_most(200) }
  it { is_expected.to validate_length_of(:edition_number).is_at_most(100) }

  # Association tests
  it { is_expected.to have_many(:lessons).dependent(:destroy) }
  it { is_expected.to have_many(:academy_sponsors).dependent(:destroy) }

  # Enum tests
  it {
    expect(academy).to define_enum_for(:status).with_values(upcoming: 'upcoming', ongoing: 'ongoing',
                                                            completed: 'completed').backed_by_column_of_type(:string)
  }
end
