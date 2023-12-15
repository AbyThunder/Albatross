class RemoveSponsorFromAcademy < ActiveRecord::Migration[7.0]
  def change
    remove_column :academies, :sponsor
  end
end
