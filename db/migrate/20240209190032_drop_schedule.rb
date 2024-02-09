class DropSchedule < ActiveRecord::Migration[7.0]
  def change
    drop_table :schedules
  end
end
