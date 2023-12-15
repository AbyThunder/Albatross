class AddNameToLessons < ActiveRecord::Migration[7.0]
  def change
    add_column :lessons, :name, :string
  end
end
