class RemoveHomeblock < ActiveRecord::Migration[7.0]
  def change
    drop_table :homeblocks
  end
end
