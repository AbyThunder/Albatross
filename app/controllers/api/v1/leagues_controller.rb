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
          create_rewards(league, params['Rewards'])
          create_sponsors(league, params['Sponsors'])
          # create_rewards(league, params[:rewards])
          # create_sponsors(league, params[:sponsors])

          render json: { message: 'League registered successfully' }, status: :created
        else
          render json: { errors: league.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def permitted_params
        params.permit(:name, :edition_number, :price, :package, :classification, :image_url, :date)
      end

      # def create_rewards(league, rewards)
      #   return unless rewards

      #   rewards.each do |reward|
      #     league.league_rewards.create(reward.permit(:condition, :sponsor, :prize))
      #   end
      # end

      # def create_sponsors(league, sponsors)
      #   return unless sponsors

      #   sponsors.each do |sponsor|
      #     league.league_sponsors.create(sponsor.permit(:name, :image_url, :description))
      #   end
      # end

      def create_rewards(league, rewards)
        rewards.each do |reward|
          LeagueReward.create(
            condition: reward['Condition'],
            sponsor: reward['Sponsor'],
            prize: reward['Reward'],
            league_id: league.id
          )
        end
      end

      def create_sponsors(league, sponsors)
        sponsors.each do |sponsor|
          LeagueSponsor.create(
            name: sponsor['Name'],
            image_url: sponsor['Image'],
            description: sponsor['Slogan'],
            league_id: league.id
          )
        end
      end
    end
  end
end
