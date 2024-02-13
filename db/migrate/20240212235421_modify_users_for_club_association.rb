class ModifyUsersForClubAssociation < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :club, foreign_key: true

    remove_column :users, :academy_id, :bigint
    remove_column :users, :league_registration_id, :bigint
  end
end
