module Api
  module V1
    class TrainersController < BaseController
      before_action :set_lesson, only: [:create]

      def create
        @trainer = Trainer.find_or_create_by(trainer_params)
        @lesson.trainers << @trainer

        if @trainer.persisted? # This checks if the trainer was newly created or already existed and was just found
          render json: { trainer: @trainer, message: 'Trainer was successfully associated.' }, status: :created
        else
          render json: { errors: @trainer.errors }, status: :unprocessable_entity
        end
      end

      private

      def set_lesson
        @lesson = Lesson.find(params[:lesson_id])
      end

      def trainer_params
        params.require(:trainer).permit(:name, :description)
      end
    end
  end
end
