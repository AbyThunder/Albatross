class AddFieldsToAcademy < ActiveRecord::Migration[7.0]
  def change
    add_column :academies, :contact, :string
    add_column :academies, :description, :string
  end
end
