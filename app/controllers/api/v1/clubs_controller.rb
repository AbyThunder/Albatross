# frozen_string_literal: true

module Api
  module V1
    class ClubsController < ApplicationControllerg
      def index
        clubs = Club.all.pluck(:name)
        render json: clubs
      end
    end
  end
end
