class AddClassificiationToLeague < ActiveRecord::Migration[7.0]
  def change
    add_column :leagues, :classification, :string
    create_table :league_rewards do |t|
      t.integer :league_id
      t.string :prize
      t.string :condition
      t.string :sponsor
      t.timestamps
    end

    add_index :league_rewards, :league_id
  end
end
