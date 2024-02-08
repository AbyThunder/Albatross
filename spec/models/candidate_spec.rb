# frozen_string_literal: true

# spec/models/candidate_spec.rb
require 'rails_helper'

RSpec.describe Candidate do
  describe 'status enum' do
    let(:candidate) { described_class.new }

    it 'defines the status enum' do
      expect(described_class.statuses).to eq({
                                               'applied' => 0,
                                               'unqualified' => 1,
                                               'qualified' => 2
                                             })
    end

    it 'sets and gets the status using string names' do
      candidate.status = 'qualified'
      expect(candidate.status).to eq('qualified')
    end

    it 'provides boolean methods for each status' do
      candidate.status = 'qualified'
      expect(candidate.qualified?).to be(true)
      expect(candidate.unqualified?).to be(false)
      expect(candidate.applied?).to be(false)
    end

    it 'scopes records by status' do
      qualified_candidate = create(:candidate, status: 'qualified')
      unqualified_candidate = create(:candidate, status: 'unqualified')

      expect(described_class.qualified).to include(qualified_candidate)
      expect(described_class.qualified).not_to include(unqualified_candidate)
    end
  end
end
