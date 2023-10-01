class AddStatusToCandidates < ActiveRecord::Migration[7.0]
  def up
    change_column :candidates, :status, :integer, using: 'status::integer'
    change_column_default :candidates, :status, from: nil, to: 0
  end

  def down
    # Convert back to string if you want a reversible migration
    change_column :candidates, :status, :string
  end
end
