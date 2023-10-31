module Api
  module V1
    class LeaguesController < ApplicationController
      skip_before_action :verify_authenticity_token
      
      def index
        league = League.all
        render json: league
      end

      def create
        league_params = JSON.parse(request.body.read)

        frontend_params = {
          edition_number: league_params["Season Number"],
          price: league_params["Participation Cost"],
          package: league_params["Participant Package"]
        }

        league = League.new(frontend_params)
        if league.save
          sponsor_params = {
            name: league_params["Sponsors"],
            description: league_params["Sponsors"],
            league_id: league.id
          }
          sponsor = LeagueSponsor.new(sponsor_params)
          if sponsor.save
            render json: { message: 'League registered successfully' }, status: :created
          end
        else
          Rails.logger.debug league.errors.full_messages.to_sentence
          Rails.logger.debug sponsor.errors.full_messages.to_sentence
          render json: { errors: league.errors }, status: :unprocessable_entity
        end
      end
    end
  end
end