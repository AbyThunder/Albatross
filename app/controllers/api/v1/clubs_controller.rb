# frozen_string_literal: true

module Api
  module V1
    class ClubsController < ApplicationController
      def index
        clubs = Club.all.pluck(:name)
        render json: clubs
      end
    end
  end
end
