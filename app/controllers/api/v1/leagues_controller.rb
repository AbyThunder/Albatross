module Api
  module V1
    class LeaguesController < ApplicationController
      skip_before_action :verify_authenticity_token
      
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
        league_params = JSON.parse(request.body.read)

        frontend_params = {
          name: league_params["Season Name"],
          edition_number: league_params["Season Number"],
          price: league_params["Participation Cost"],
          package: league_params["Participant Package"],
          classification: league_params["General Classification"],
          image_url: league_params["League Image"],
          date: league_params["Date"]
        }

        league = League.new(frontend_params)

        if league.save
          create_rewards(league, league_params["Rewards"])
          create_sponsors(league, league_params["Sponsors"])

          render json: { message: 'League registered successfully' }, status: :created
        else
          Rails.logger.debug league.errors.full_messages.to_sentence
          render json: { errors: league.errors }, status: :unprocessable_entity
        end
      end

      private

      def create_rewards(league, rewards)
        rewards.each do |reward|
          LeagueReward.create(
            condition: reward["Condition"],
            sponsor: reward["Sponsor"],
            prize: reward["Reward"],
            league_id: league.id
          )
        end
      end

      def create_sponsors(league, sponsors)
        sponsors.each do |sponsor|
          LeagueSponsor.create(
            name: sponsor["Name"],
            image_url: sponsor["Image"],
            description: sponsor["Slogan"],
            league_id: league.id
          )
        end
      end
    end
  end
end