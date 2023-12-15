class DropUnusedTables < ActiveRecord::Migration[7.0]
  def change
    drop_table :classification_types
    drop_table :general_classifications
    drop_table :general_rewards
    drop_table :other_classifications
    drop_table :other_rewards
  end
end
