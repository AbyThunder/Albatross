# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Academy do
  subject(:academy) { create(:academy) }

  describe 'associations' do
    it { is_expected.to have_many(:lessons).dependent(:destroy) }
    it { is_expected.to have_many(:academy_sponsors).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:season) }
    it { is_expected.to validate_presence_of(:package) }
    it { is_expected.to validate_presence_of(:edition_number) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:contact) }

    it { is_expected.to validate_length_of(:description).is_at_most(255) }
    it { is_expected.to validate_length_of(:contact).is_at_most(255) }
    it { is_expected.to validate_length_of(:name).is_at_most(100) }
    it { is_expected.to validate_length_of(:season).is_at_most(100) }
    it { is_expected.to validate_length_of(:package).is_at_most(255) }
    it { is_expected.to validate_length_of(:edition_number).is_at_most(100) }
  end

  describe 'enums' do
    it do
      expect(academy).to define_enum_for(:status)
        .with_values(upcoming: 'upcoming', ongoing: 'ongoing', completed: 'completed')
        .backed_by_column_of_type(:string)
    end
  end
end
