# frozen_string_literal: true

module Api
  module V1
    class AcademiesController < ApplicationController
      # before_action :set_academy, only: [:show, :update, :destroy, :create_lesson]

      def index
        academies = Academy.all
        render json: academies, is_index: true
      end

      def show
        academy = Academy.find(params[:id])
        render json: academy, is_edit: true
      end

      def create
        academy = Academy.new(permitted_params)

        if academy.save
          create_sponsors(academy, params['Sponsors'])
          render json: { message: 'Academy registered successfully' }, status: :created
        else
          render json: { errors: academy.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def permitted_params
        params.permit(:name, :season, :edition_number, :package, :image)
      end

      def create_sponsors(academy, sponsors)
        sponsors.each do |sponsor|
          AcademySponsor.create(
            name: sponsor['Name'],
            image_url: sponsor['Image'],
            description: sponsor['Slogan'],
            academy_id: academy.id
          )
        end
      end
    end
  end
end
