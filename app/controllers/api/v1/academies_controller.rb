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
        params.permit(:name, :season, :edition_number, :package, :description, :contact) # :image
      end

      def create_or_update_sponsors(academy, sponsors, update)
        if update
          academy.academy_sponsors.destroy_all

          sponsors&.each do |sponsors|
            academy.academy_sponsors.create(sponsors.permit(:name, :image, :description))
          end
        else
          sponsors&.each do |sponsors|
            academy.academy_sponsors.create(sponsors.permit(:name, :image, :description))
          end
        end
      end
    end
  end
end
