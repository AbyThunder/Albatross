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
          create_or_update_sponsors(academy, params[:sponsors], false)
          render json: { message: 'Academy registered successfully' }, status: :created
        else
          render json: { errors: academy.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        academy = Academy.find(params[:id])

        if academy.update(permitted_params)
          create_or_update_sponsors(academy, params[:sponsors], update)
          render json: { message: 'Academy updated successfully' }, status: :ok
        else
          render json: { errors: academy.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def permitted_params
        params.permit(:name, :season, :edition_number, :package) # :image
      end

      def create_or_update_sponsors(academy, sponsors, update)
        sponsors&.each do |sponsor|
          filtered_params = sponsor.permit(:name, :image_url, :description)

          if update
            s = academy.academy_sponsors.find_or_initialize_by(name: filtered_params[:name])
            s.update(filtered_params)
          else
            academy.academy_sponsors.create(filtered_params)
          end
        end
      end
    end
  end
end
