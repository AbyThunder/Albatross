class AddTournamentSponsorsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :tourament_sponsors do |t|
      t.belongs_to :tournament, index: true
      t.string :name
      t.string :image_url
      t.string :description
      t.timestamps
    end 
  end
end
