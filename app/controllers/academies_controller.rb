class AcademiesController < ApplicationController
  def index
    # Retrieve all academies from the database
    @academies = Academy.all
    @academy_sponsors = Sponsor.joins(:academies).distinct
  end

  def show
    # Find a specific academy based on the ID parameter
    @academy = Academy.find(params[:id])
    @sponsors = @academy.sponsors.distinct
    @lessons = @academy.lessons.includes(:trainers)
  end

  def new
    # Initialize a new academy object
    @academy = Academy.new
  end

  def create
    # Create a new academy with the provided parameters
    @academy = Academy.new(academy_params)
    if @academy.save
      redirect_to @academy, notice: 'Academy was successfully created.'
    else
      render :new
    end
  end

  def edit
    # Find a specific academy based on the ID parameter
    @academy = Academy.find(params[:id])
    @existing_sponsors = Sponsor.all
  end

  def update
    # Find a specific academy based on the ID parameter
    @academy = Academy.find(params[:id])
    if @academy.update(academy_params)
      redirect_to @academy, notice: 'Academy was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    # Find a specific academy based on the ID parameter and delete it
    @academy = Academy.find(params[:id])
    @academy.destroy
    redirect_to academies_path, notice: 'Academy was successfully destroyed.'
  end

  private

  def academy_params
    # Define the permitted parameters for the academy model
    params.require(:academy).permit(:edition_number, :package, :season, sponsor_ids: [])
  end

  def new_lesson
    @academy = Academy.find(params[:id])
    @lesson = @academy.lessons.build
  end


  def create_lesson
    @academy = Academy.find(params[:id])
    @lesson = @academy.lessons.build(lesson_params)
    if @lesson.save
      redirect_to academy_path(@academy), notice: 'Lesson was successfully created.'
    else
      render 'new_lesson', academy: @academy
    end
  end

  def lesson_params
    params.require(:lesson).permit(:date, :place, :description, :freebie)
  end
end
