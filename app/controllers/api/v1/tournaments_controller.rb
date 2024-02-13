# frozen_string_literal: true

module Api
  module V1
    class TournamentsController < ApplicationController
      # before_action :set_league, only: [:create, :update]

      def index
        tournaments = Tournament.all
        render json: tournaments, is_index: true
      end

      def show
        tournament = Tournament.find(params[:id])
        render json: tournament, is_edit: true
      end

      def create
        tournament = Tournament.new(tournament_params.merge(league_id: @league.id))

        if tournament.save
          # handle_rewards_and_sponsors(tournament, params)
          create_rewards(tournament, tournament_params['Rewards'])
          create_sponsors(tournament, tournament_params['Sponsors'])
          render json: { message: 'Tournament registered successfully' }, status: :created
        else
          render json: { errors: tournament.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        tournament = Tournament.find(params[:id])
        tournament_params.merge(league_id: @league.id)

        if tournament.update(tournament_params)
          # handle_rewards_and_sponsors(tournament, params, update: true)
          update_rewards(tournament, tournament_params['Rewards'])
          update_sponsors(tournament, tournament_params['Sponsors'])
          render json: { message: 'Tournament updated successfully' }, status: :ok
        else
          render json: { errors: tournament.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def set_league
        @league = League.find_by(name: params[:associated_league])
        render json: { error: 'League not found' }, status: :not_found unless @league
      end

      def tournament_params
        params.require(:tournament).permit(:name, :date, :place, :time, :num_rounds, :holes, :cost, :package,
                                           :additional_information, :formula, :hcp, :min_players, :max_players,
                                           :gen_classification, :image_url)
      end

      def create_rewards(tournament, rewards)
        rewards.each do |reward|
          TournamentReward.create(
            condition: reward['Condition'],
            sponsor: reward['Sponsor'],
            prize: reward['Reward'],
            tournament_id: tournament.id
          )
        end
      end

      def create_sponsors(tournament, sponsors)
        sponsors.each do |sponsor|
          TournamentSponsor.create(
            name: sponsor['Name'],
            image_url: sponsor['Image'],
            description: sponsor['Slogan'],
            tournament_id: tournament.id
          )
        end
      end

      def update_rewards(tournament, rewards)
        rewards.each do |reward|
          existing_reward = TournamentReward.find_by(tournament_id: tournament.id, condition: reward['Condition'])

          if existing_reward
            existing_reward.update(
              sponsor: reward['Sponsor'],
              prize: reward['Reward']
            )
          else
            TournamentReward.create(
              condition: reward['Condition'],
              sponsor: reward['Sponsor'],
              prize: reward['Reward'],
              tournament_id: tournament.id
            )
          end
        end
      end

      def update_sponsors(tournament, sponsors)
        sponsors.each do |sponsor|
          existing_sponsor = TournamentSponsor.find_by(tournament_id: tournament.id, name: sponsor['Name'])

          if existing_sponsor
            existing_sponsor.update(
              image_url: sponsor['Image'],
              description: sponsor['Slogan']
            )
          else
            TournamentSponsor.create(
              name: sponsor['Name'],
              image_url: sponsor['Image'],
              description: sponsor['Slogan'],
              tournament_id: tournament.id
            )
          end
        end
      end

      # def handle_rewards_and_sponsors(tournament, params, update: false)
      #   create_or_update_rewards(tournament, params[:rewards], update)
      #   create_or_update_sponsors(tournament, params[:sponsors], update)
      # end

      # def create_or_update_rewards(tournament, rewards, update)
      #   rewards&.each do |reward|
      #     if update
      #       r = tournament.tournament_rewards.find_or_initialize_by(condition: reward[:condition])
      #       r.update(reward.slice(:sponsor, :prize))
      #     else
      #       tournament.tournament_rewards.create(reward.permit(:condition, :sponsor, :prize))
      #     end
      #   end
      # end

      # def create_or_update_sponsors(tournament, sponsors, update)
      #   sponsors&.each do |sponsor|
      #     if update
      #       s = tournament.tournament_sponsors.find_or_initialize_by(name: sponsor[:name])
      #       s.update(sponsor.slice(:image_url, :description))
      #     else
      #       tournament.tournament_sponsors.create(sponsor.permit(:name, :image_url, :description))
      #     end
      #   end
      # end
    end
  end
end
