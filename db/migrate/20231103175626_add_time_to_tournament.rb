class AddTimeToTournament < ActiveRecord::Migration[7.0]
  def change
    add_column :tournaments, :time, :string
  end
end
