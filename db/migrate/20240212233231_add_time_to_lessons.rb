class AddTimeToLessons < ActiveRecord::Migration[7.0]
  def change
    add_column :lessons, :time, :string
  end
end
