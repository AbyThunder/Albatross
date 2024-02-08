# frozen_string_literal: true

module Api
  module V1
    class ManagersController < BaseController
      def assign_trainer
        user = User.find(params[:user_id])
        lessons = Lesson.all
        render json: { user: user, lessons: lessons }
      end

      def save_trainer_assignment
        user = User.find(params[:user_id])
        lesson_ids = params[:lesson_ids]

        if user.update(role: :trainer)
          user.lessons << Lesson.where(id: lesson_ids)
          render json: { user: user, message: 'User was successfully assigned as a trainer.' }, status: :ok
        else
          render json: { errors: user.errors }, status: :unprocessable_entity
        end
      end
    end
  end
end
