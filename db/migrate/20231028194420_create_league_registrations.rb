class CreateLeagueRegistrations < ActiveRecord::Migration[7.0]
  def change
    create_table :league_registrations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :league, null: false, foreign_key: true
      t.boolean :current, default: true

      t.timestamps
    end
  end
end
