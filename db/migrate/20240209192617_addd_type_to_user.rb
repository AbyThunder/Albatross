class AdddTypeToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :type, :string, default: 'User', null: false
  end
end
