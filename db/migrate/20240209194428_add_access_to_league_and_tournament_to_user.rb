class AddAccessToLeagueAndTournamentToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :access_to_league_and_tournament, :boolean, default: false
  end
end
