# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Lesson do
  subject(:lesson) { create(:lesson) }

  describe 'associations' do
    it { is_expected.to belong_to(:academy) }
    it { is_expected.to have_many(:lesson_rewards).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:date) }
    it { is_expected.to validate_presence_of(:time) }
    it { is_expected.to validate_presence_of(:place) }

    it { is_expected.to validate_length_of(:name).is_at_most(100) }
    it { is_expected.to validate_length_of(:place).is_at_most(255) }
    it { is_expected.to validate_length_of(:description).is_at_most(500) }
    it { is_expected.to validate_length_of(:freebie).is_at_most(255).allow_blank }
  end
end
