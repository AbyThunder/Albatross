# frozen_string_literal: true

module Api
  module V1
    class SponsorsController < ApplicationController
      def create
        @academy = Academy.find(params[:academy_id])
        @sponsor = @academy.sponsors.build(sponsor_params)

        if @sponsor.save
          render json: { sponsor: @sponsor, message: 'Sponsor was successfully created.' }, status: :created
        else
          render json: { errors: @sponsor.errors }, status: :unprocessable_entity
        end
      end

      private

      def sponsor_params
        params.require(:sponsor).permit(:name, :description)
      end
    end
  end
end
