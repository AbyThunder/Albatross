module Api
  module V1
    class LessonsController < BaseController
      skip_before_action :verify_authenticity_token

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
        lesson_params = JSON.parse(request.body.read)

        academy_name = lesson_params["Associated Academy"]
        academy = Academy.find_by(name: academy_name)

        frontend_params = {
          name: lesson_params["Name"],
          description: lesson_params["Activity List"],
          date: lesson_params["Date"],
          place: lesson_params["Location"],
          freebie: lesson_params["Gratis Items"],
          academy_id: 1 #academy.id
        }

        lesson = Lesson.new(frontend_params)

        if lesson.save
          create_rewards(lesson, lesson_params["Rewards"])

          render json: { message: 'League registered successfully' }, status: :created
        else
          Rails.logger.debug lesson.errors.full_messages.to_sentence
          render json: { errors: lesson.errors }, status: :unprocessable_entity
        end
      end

      private

      def create_rewards(lesson, rewards)
        rewards.each do |reward|
          LessonReward.create(
            condition: reward["Condition"],
            sponsor: reward["Sponsor"],
            prize: reward["Reward"],
            lesson_id: lesson.id
          )
        end
      end
    end
  end
end
