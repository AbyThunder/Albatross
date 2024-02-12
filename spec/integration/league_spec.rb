# spec/integration/leagues_spec.rb
require 'swagger_helper'

describe 'Leagues API' do
  path '/api/v1/leagues' do

    post 'Creates a league' do
      tags 'Leagues'
      consumes 'application/json'
      parameter name: :league, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          editionNumber: { type: :integer },
          date: { type: :string, format: 'date' },
          participationCost: { type: :integer },
          participantPackage: { type: :string },
          generalClassification: { type: :string },
          leagueImage: { type: :string },
          rewards: {
            type: :array,
            items: {
              type: :object,
              properties: {
                classification: { type: :string },
                reward: { type: :string }
              }
            }
          },
          sponsors: {
            type: :array,
            items: {
              type: :object,
              properties: {
                name: { type: :string },
                description: { type: :string },
                image: { type: :string }
              }
            }
          }
        },
        required: ['name', 'editionNumber', 'date', 'participationCost']
      }

      response '201', 'league created' do
        let(:league) { { name: 'Spring 2024', editionNumber: 1, date: '2024-03-01', participationCost: 100, participantPackage: 'Basic', generalClassification: 'Open', leagueImage: 'http://example.com/image.png', rewards: [], sponsors: [] } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:league) { { name: '' } } # Missing required fields
        run_test!
      end
    end
  end

  # Additional specs for fetching leagues and getting league details can follow a similar structure
end
