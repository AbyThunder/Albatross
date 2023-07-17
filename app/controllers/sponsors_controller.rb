class SponsorsController < ApplicationController
  def new
    @academy = Academy.find(params[:academy_id])
    @sponsor = Sponsor.new
  end

  def create
    @academy = Academy.find(params[:academy_id])
    @sponsor = @academy.sponsors.build(sponsor_params)
    if @sponsor.save
      redirect_to edit_academy_path(@academy), notice: 'Sponsor was successfully created.'
    else
      render 'academies/edit' and return
    end
  end

  private

  def sponsor_params
    params.require(:sponsor).permit(:name, :description)
  end
end
