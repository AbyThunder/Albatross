module Api
  module V1
    class AcademiesController < ApplicationController
      before_action :set_academy, only: [:show, :update, :destroy, :create_lesson]

      def index
        academies = Academy.all
        render json: AcademySerializer.new(academies).serializable_hash
      end

      def show
        render json: {
          academy: AcademySerializer.new(@academy),
          sponsors: @academy.sponsors.distinct,
          lessons: LessonSerializer.new(@academy.lessons.includes(:trainers))
        }
      end

      def create
        academy = Academy.new(academy_params)
        if academy.save
          render json: AcademySerializer.new(academy), status: :created
        else
          render json: { errors: academy.errors }, status: :unprocessable_entity
        end
      end

      def update
        if @academy.update(academy_params)
          render json: AcademySerializer.new(@academy), status: :ok
        else
          render json: { errors: @academy.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        @academy.destroy
        render json: { message: 'Academy was successfully destroyed.' }, status: :ok
      end

      def create_lesson
        lesson = @academy.lessons.build(lesson_params)
        if lesson.save
          render json: LessonSerializer.new(lesson), status: :created
        else
          render json: { errors: lesson.errors }, status: :unprocessable_entity
        end
      end

      private

      def set_academy
        @academy = Academy.find(params[:id])
      end

      def academy_params
        params.require(:academy).permit(:edition_number, :package, :season, sponsor_ids: [])
      end

      def lesson_params
        params.require(:lesson).permit(:date, :place, :description, :freebie)
      end
    end
  end
end
