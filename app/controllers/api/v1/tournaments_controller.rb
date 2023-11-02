module Api
  module V1
    class TournamentsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        tournaments = Tournament.all
        render json: tournaments
      end
  
      def create
        tournament_params = JSON.parse(request.body.read)

        errors = []

        # Convert and validate values
        num_rounds = integer_param(tournament_params["Amount of Rounds"], errors, "Amount of Rounds")
        holes = integer_param(tournament_params["Amount of Holes"], errors, "Amount of Holes")
        min_players = integer_param(tournament_params["Min Players"], errors, "Min Players")
        max_players = integer_param(tournament_params["Max Players"], errors, "Max Players")
        hcp = float_param(tournament_params["HCP"], errors, "HCP")

        # Validate positive integers
        errors << "Number of Rounds must be a positive number" if num_rounds && num_rounds <= 0
        errors << "Number of Holes must be a positive number" if holes && holes <= 0
        errors << "Minimum Players must be a non-negative number" if min_players && min_players < 0
        errors << "Maximum Players must be a positive number" if max_players && max_players <= 0

        unless errors.empty?
          render json: { errors: errors }, status: :bad_request
          return
        end

        league_name = tournament_params["Associated League"]
        league = League.find_by(name: league_name)

        unless league
          render json: { errors: "League not found" }, status: :not_found
          return
        end

        frontend_params = {
          name: tournament_params["Name of Tournament"],
          date: tournament_params["Date of Tournament"],
          place: tournament_params["Playing Field"],
          num_rounds: tournament_params["Amount of Rounds"],
          holes: tournament_params["Amount of Holes"],
          cost: tournament_params["Price of Participation"],
          package: tournament_params["What is in the price?"],
          additional_information: tournament_params["Additional Information"],
          formula: tournament_params["Formula"],
          hcp: tournament_params["HCP"],
          min_players: tournament_params["Min Players"],
          max_players: tournament_params["Max Players"],
          league_id: league.id
        }

        tournament = Tournament.new(frontend_params)

        if tournament.save
          create_rewards(tournament, tournament_params["Rewards"])
          create_sponsors(tournament, tournament_params["Sponsors"])

          render json: { message: 'Tournament registered successfully' }, status: :created
        else
          Rails.logger.debug tournament.errors.full_messages.to_sentence
          render json: { errors: tournament.errors }, status: :unprocessable_entity
        end
      end

      private

      def create_rewards(tournament, rewards)
        rewards.each do |reward|
          TournamentReward.create(
            condition: reward["Condition"],
            sponsor: reward["Sponsor"],
            prize: reward["Reward"],
            tournament_id: tournament.id
          )
        end
      end

      def create_sponsors(tournament, sponsors)
        sponsors.each do |sponsor|
          TournamentSponsor.create(
            name: sponsor["Name"],
            image_url: sponsor["Image"],
            description: sponsor["Slogan"],
            tournament_id: tournament.id
          )
        end
      end

      def integer_param(value, errors, field_name)
        Integer(value)
      rescue ArgumentError
        errors << "#{field_name} must be a valid integer"
        nil
      end

      def float_param(value, errors, field_name)
        Float(value)
      rescue ArgumentError
        errors << "#{field_name} must be a valid float"
        nil
      end
    end
  end
end