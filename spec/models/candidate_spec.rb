# spec/models/candidate_spec.rb
require 'rails_helper'

RSpec.describe Candidate, type: :model do
  describe 'status enum' do
    let(:candidate) { Candidate.new }

    it 'defines the status enum' do
      expect(Candidate.statuses).to eq({
        "applied" => 0,
        "unqualified" => 1,
        "qualified" => 2
      })
    end

    it 'sets and gets the status using string names' do
      candidate.status = "qualified"
      expect(candidate.status).to eq("qualified")
    end

    it 'provides boolean methods for each status' do
      candidate.status = "qualified"
      expect(candidate.qualified?).to be(true)
      expect(candidate.unqualified?).to be(false)
      expect(candidate.applied?).to be(false)
    end

    it 'scopes records by status' do
      qualified_candidate = FactoryBot.create(:candidate, status: "qualified")
      unqualified_candidate = FactoryBot.create(:candidate, status: "unqualified")

      expect(Candidate.qualified).to include(qualified_candidate)
      expect(Candidate.qualified).not_to include(unqualified_candidate)
    end
  end
end
