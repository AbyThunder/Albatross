class RenameCandidatesLessonsToUsersLessons < ActiveRecord::Migration[7.0]
  def change
    rename_table :candidates_lessons, :users_lessons
    rename_column :users_lessons, :candidate_id, :user_id
  end
end
