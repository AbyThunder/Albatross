class DropCandidatesTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :candidates
    drop_table :players
  end
end
