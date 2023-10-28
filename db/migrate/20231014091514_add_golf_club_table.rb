class AddGolfClubTable < ActiveRecord::Migration[7.0]
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :address
      t.string :contact_full_name
      t.string :contact_phone_number

      t.timestamps
    end

    # Create a join table for the many-to-many relationship with users
    create_join_table :clubs, :users do |t|
      t.index [:club_id, :user_id]
      t.index [:user_id, :club_id]
    end
  end
end
