class LessonsController < ApplicationController
  def new
    @academy = Academy.find(params[:academy_id])
    @lesson = @academy.lessons.build
  end

  def create
    @academy = Academy.find(params[:academy_id])
    @lesson = @academy.lessons.build(lesson_params)
    if @lesson.save
      redirect_to academy_path(@academy), notice: 'Lesson was successfully created.'
    else
      render :new
    end
  end

  private

  def lesson_params
    params.require(:lesson).permit(:date, :place, :description, :freebie)
  end
end
