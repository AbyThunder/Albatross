class ChangeEditionNumberToStringInAcademies < ActiveRecord::Migration[7.0]
  def change
    change_column :academies, :edition_number, :string
  end
end
