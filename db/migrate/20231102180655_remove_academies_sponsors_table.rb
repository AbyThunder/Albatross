class RemoveAcademiesSponsorsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :academies_sponsors
    add_column :academy_sponsors, :image_url, :string
    rename_table :competitions, :lesson_competitions
    add_column :league_sponsors, :image_url, :string
    rename_table :results, :tournament_results
    rename_table :extra_contests, :tournament_rewards
  end
end
