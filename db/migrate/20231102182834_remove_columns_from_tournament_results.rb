class RemoveColumnsFromTournamentResults < ActiveRecord::Migration[7.0]
  def change
    remove_column :tournament_rewards, :name
    remove_column :tournament_rewards, :description
    rename_column :tournament_rewards, :hole, :condition
  end
end
