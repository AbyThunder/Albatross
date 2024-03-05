# frozen_string_literal: true

module Api
  module V1
    class LessonsController < ApplicationController
      def index
        lesson = Lesson.all
        render json: lesson, is_index: true
      end

      def names
        lesson_names = Lesson.all.pluck(:name)
        render json: lesson_names
      end

      def show
        lesson = Lesson.find(params[:id])
        render json: lesson, is_edit: true
      end

      def create
        lesson = Lesson.new(permitted_params)

        if lesson.save
          create_or_update_rewards(lesson, params[:rewards], false)
          render json: { message: 'Lesson registered successfully' }, status: :created
        else
          render json: { errors: lesson.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        lesson = Lesson.find(params[:id])

        if lesson.update(permitted_params)
          create_or_update_rewards(lesson, params[:rewards], update: true)
          render json: { message: 'Lesson updated successfully' }, status: :ok
        else
          render json: { errors: lesson.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def permitted_params
        params.permit(:name, :description, :date, :place, :freebie, :academy_id, :time)
      end

      def reward_params
        params.permit(:condition, :sponsor, :prize)
      end

      def create_or_update_rewards(lesson, rewards, update)
        if update
          lesson.lesson_rewards.destroy_all

          rewards&.each do |reward|
            lesson.lesson_rewards.create(reward_params)
          end
        else
          rewards&.each do |reward|
            lesson.lesson_rewards.create(reward_params)
          end
        end
      end
    end
  end
end
