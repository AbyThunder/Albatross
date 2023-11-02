class RenameTables < ActiveRecord::Migration[7.0]
  def change
    rename_table :sponsors, :academy_sponsors
  end
end
