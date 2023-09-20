class AddSeasonToAcademy < ActiveRecord::Migration[7.0]
  def change
    add_column :academies, :season, :string
  end
end
