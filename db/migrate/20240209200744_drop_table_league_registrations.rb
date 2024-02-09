class DropTableLeagueRegistrations < ActiveRecord::Migration[7.0]
  def change
    drop_table :league_registrations
  end
end
