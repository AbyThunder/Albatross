class RenameTouramentSponsorsToTournamentSponsors < ActiveRecord::Migration[7.0]
  def change
    rename_table :tourament_sponsors, :tournament_sponsors
  end
end
