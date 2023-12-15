module Api
  module V1
    class AcademiesController < ApplicationController
      #before_action :set_academy, only: [:show, :update, :destroy, :create_lesson]
      skip_before_action :verify_authenticity_token

      def index
        academies = Academy.all
        render json: academies, is_index: true
      end

      def show
        academy = Academy.find(params[:id])
        render json: academy, is_edit: true
      end

      def create
        academy_params = JSON.parse(request.body.read)

        frontend_params = {
          edition_number: academy_params["Editon Number"],
          package: academy_params["Participant Package"],
          season: academy_params["Time Period"],
          sponsor: academy_params["Sponsors"],
          image_url: academy_params["Academy Image"],
        }

        academy = Academy.new(frontend_params)

        if academy.save
          create_sponsors(academy, academy_params["Sponsors"])

          render json: { message: 'Academy registered successfully' }, status: :created
        else
          Rails.logger.debug user.errors.full_messages.to_sentence
          render json: { errors: academy.errors }, status: :unprocessable_entity
        end
      end

      private

      def create_sponsors(academy, sponsors)
        sponsors.each do |sponsor|
          AcademySponsor.create(
            name: sponsor["Name"],
            image_url: sponsor["Image"],
            description: sponsor["Slogan"],
            academy_id: academy.id
          )
        end
      end
    end
  end
end
