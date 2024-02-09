class RemoveTrainerModel < ActiveRecord::Migration[7.0]
  def change
    drop_table :trainers
    drop_table :trainers_lessons
  end
end
