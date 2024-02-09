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
        render json: build_academy_json(academy), is_edit: true
      end

      def create
        academy_params = JSON.parse(request.body.read)

        frontend_params = {
          name: academy_params['Academy Name'],
          edition_number: academy_params['Editon Number'],
          package: academy_params['Participant Package'],
          season: academy_params['Time Period'],
          image_url: academy_params['Academy Image']
        }

        academy = Academy.new(frontend_params)

        if academy.save
          create_sponsors(academy, academy_params['Sponsors'])

          render json: { message: 'Academy registered successfully' }, status: :created
        else
          Rails.logger.debug(user.errors.full_messages.to_sentence)
          render json: { errors: academy.errors }, status: :unprocessable_entity
        end
      end

      private

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

      def build_academy_json(academy)
        {
          id: academy.id,
          name: academy.name,
          'home-boxes': build_home_boxes(academy)
          # Additional academy details...
        }
      end

      def build_home_boxes(academy)
        # Assuming you have a method for each box type
        [
          build_status_box(academy),
          build_player_details_box(academy),
          build_image_box(academy),
          build_reference_box(academy),
          build_table_box(academy)
          # Add more boxes as needed
        ]
      end

      # Example method to build a specific box
      def build_status_box(_academy)
        {
          BoxType: 'TextBox',
          Title: 'My Status',
          LowerText: 'Academy status or description here'
          # Use academy data to fill in details
        }
      end

      def build_player_details_box(academy)
        {
          BoxType: 'PlayerList',
          Title: 'Players in Academy',
          Players: academy.players.map(&:name) # Assuming players have names
        }
      end
    end
  end
end
