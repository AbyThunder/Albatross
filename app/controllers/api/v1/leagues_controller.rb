# frozen_string_literal: true

module Api
  module V1
    class LeaguesController < ApplicationController
      def index
        league = League.all
        render json: league, is_index: true
      end

      def names
        league_names = League.all.pluck(:name)
        render json: league_names
      end

      def show
        league = League.find(params[:id])
        render json: league, is_edit: true
      end

      def create
        league = League.new(permitted_params)

        if league.save
          handle_rewards_and_sponsors(league, params)

          render json: { message: 'League registered successfully' }, status: :created
        else
          render json: { errors: league.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        league = League.find(params[:id])

        if league.update(permitted_params)
          handle_rewards_and_sponsors(league, params, update: true)
          render json: { message: 'League updated successfully' }, status: :ok
        else
          render json: { errors: league.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def permitted_params
        params.permit(:name, :edition_number, :price, :package, :classification, :image_url, :date)
      end

      def handle_rewards_and_sponsors(league, params, update: false)
        create_or_update_rewards(league, params[:rewards], update)
        create_or_update_sponsors(league, params[:sponsors], update)
      end

      def create_or_update_rewards(league, rewards, update)
        rewards&.each do |reward|
          if update
            r = league.league_rewards.find_or_initialize_by(condition: reward[:condition])
            r.update(reward.slice(:sponsor, :prize))
          else
            league.league_rewards.create(reward.permit(:condition, :sponsor, :prize))
          end
        end
      end

      def create_or_update_sponsors(league, sponsors, update)
        sponsors&.each do |sponsor|
          if update
            s = league.league_sponsors.find_or_initialize_by(name: sponsor[:name])
            s.update(sponsor.slice(:image_url, :description))
          else
            league.league_sponsors.create(sponsor.permit(:name, :image_url, :description))
          end
        end
      end
    end
  end
end
