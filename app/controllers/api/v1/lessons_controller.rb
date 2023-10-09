module Api
  module V1
    class LessonsController < BaseController
      before_action :authenticate_user!
      load_and_authorize_resource

      def create
        @academy = Academy.find(params[:academy_id])
        @lesson = @academy.lessons.build(lesson_params)
        
        if @lesson.save
          render json: { lesson: @lesson, message: 'Lesson was successfully created.' }, status: :created
        else
          render json: { errors: @lesson.errors }, status: :unprocessable_entity
        end
      end

      private

      def lesson_params
        params.require(:lesson).permit(:date, :place, :description, :freebie)
      end
    end
  end
end
