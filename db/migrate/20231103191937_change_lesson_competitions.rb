class ChangeLessonCompetitions < ActiveRecord::Migration[7.0]
  def change
    rename_table :lesson_competitions, :lesson_rewards
    rename_column :lesson_rewards, :name, :sponsor
    rename_column :lesson_rewards, :description, :condition
  end
end
