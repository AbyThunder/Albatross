class CreateTournamentRegistrations < ActiveRecord::Migration[7.0]
  def change
    create_table :tournament_registrations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :tournament, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
