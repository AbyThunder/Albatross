class ManagersController < ApplicationController
  def assign_trainer
    @user = User.find(params[:user_id])
    @lessons = Lesson.all # or any logic to retrieve relevant lessons
  end

  def save_trainer_assignment
    @user = User.find(params[:user_id])
    @lesson_ids = params[:lesson_ids]

    if @user.update(role: :trainer)
      @user.lessons << Lesson.where(id: @lesson_ids)
      redirect_to @user, notice: 'User was successfully assigned as a trainer.'
    else
      redirect_to @user, alert: 'Failed to assign the user as a trainer.'
    end
  end
end
