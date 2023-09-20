class TrainersController < ApplicationController
  before_action :set_lesson, only: [:new, :create]

  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.find_or_create_by(trainer_params)
    @lesson.trainers << @trainer
    redirect_to @lesson, notice: 'Trainer was successfully created.'
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

  def trainer_params
    params.require(:trainer).permit(:name, :description)
  end
end
