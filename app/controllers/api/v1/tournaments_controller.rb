# frozen_string_literal: true

module Api
  module V1
    class TournamentsController < ApplicationController
      before_action :set_league, only: %i[create update]

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
          handle_rewards_and_sponsors(tournament, params)
          render json: { message: 'Tournament registered successfully' }, status: :created
        else
          render json: { errors: tournament.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        tournament = Tournament.find(params[:id])
        tournament_params.merge(league_id: @league.id)

        if tournament.update(tournament_params)
          handle_rewards_and_sponsors(tournament, params, update: true)
          render json: { message: 'Tournament updated successfully' }, status: :ok
        else
          render json: { errors: tournament.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def set_league
        @league = League.find_by(name: params[:league_id])
        render json: { error: 'League not found' }, status: :not_found unless @league
      end

      def tournament_params
        params.permit(:name, :date, :place, :time, :num_rounds, :holes, :cost, :package,
                      :additional_information, :formula, :hcp, :min_players, :max_players,
                      :gen_classification, :image_url)
      end

      def handle_rewards_and_sponsors(tournament, params, update: false)
        create_or_update_rewards(tournament, params[:rewards], update)
        create_or_update_sponsors(tournament, params[:sponsors], update)
      end

      def create_or_update_rewards(tournament, rewards, update)
        if update
          tournament.tournament_rewards.destroy_all

          rewards&.each do |reward|
            tournament.tournament_rewards.create(reward.permit(:condition, :sponsor, :prize))
          end
        else
          rewards&.each do |reward|
            tournament.tournament_rewards.create(reward.permit(:condition, :sponsor, :prize))
          end
        end
      end

      def create_or_update_sponsors(tournament, sponsors, update)
        if update
          tournament.tournament_sponsors.destroy_all

          sponsors&.each do |sponsors|
            tournament.tournament_sponsors.create(sponsors.permit(:name, :image, :description))
          end
        else
          sponsors&.each do |sponsors|
            tournament.tournament_sponsors.create(sponsors.permit(:name, :image, :description))
          end
        end
      end
    end
  end
end
