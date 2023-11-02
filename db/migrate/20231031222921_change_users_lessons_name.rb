class ChangeUsersLessonsName < ActiveRecord::Migration[7.0]
  def change
    rename_table :users_lessons, :lessons_users
  end
end
