# app/controllers/api/v1/clubs_controller.rb

module Api
  module V1
    class ClubsController < BaseController
      def index
        clubs = Club.all.pluck(:name)
        render json: clubs
      end
    end
  end
end
