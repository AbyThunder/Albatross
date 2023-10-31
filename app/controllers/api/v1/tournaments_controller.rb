module Api
  module V1
    class TournamentsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        tournament = Tournament.all
        render json: tournament
      end
  
      def create
        tournament_params = JSON.parse(request.body.read)

        frontend_params = {
          name: tournament_params["Name of Tournament"],
          date: tournament_params["Date of Tournament"],
          place: tournament_params["Playing Field"],
          num_rounds: tournament_params["Amount of Rounds"],
          cost: tournament_params["Price of Participation"],
          additional_costs: tournament_params["What is in the price?"],
          league_id: 1
        }

        tournament = Tournament.new(frontend_params)

        if tournament.save
          render json: { message: 'Tournament registered successfully' }, status: :created
        else
          Rails.logger.debug tournament.errors.full_messages.to_sentence
          render json: { errors: tournament.errors }, status: :unprocessable_entity
        end
      end
    end
  end
end