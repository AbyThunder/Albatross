class AddStatusToLesson < ActiveRecord::Migration[7.0]
  def change
    add_column :lessons, :status, :string, default: "upcoming", null: false
  end
end
