class UpdateEditionToStringInLeague < ActiveRecord::Migration[7.0]
  def change
    change_column :leagues, :edition_number, :string
  end
end
