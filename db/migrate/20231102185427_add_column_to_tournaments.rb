class AddColumnToTournaments < ActiveRecord::Migration[7.0]
  def change
    add_column :tournaments, :additional_information, :string
  end
end
