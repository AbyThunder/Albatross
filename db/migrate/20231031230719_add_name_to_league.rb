class AddNameToLeague < ActiveRecord::Migration[7.0]
  def change
    add_column :leagues, :name, :string
    add_column :academies, :name, :string
  end
end
