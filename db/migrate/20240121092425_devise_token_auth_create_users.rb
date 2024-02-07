class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[7.0]
  def change
    
    change_table(:users) do |t|
      ## Devise Token Auth fields
      t.string :provider, null: false, default: "email"
      t.string :uid, null: false, default: ""
      t.json :tokens

      ## Additional fields if not present
      t.boolean :allow_password_change, default: false
      t.string :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string :unconfirmed_email

      # Add any other missing fields here
    end

    # Add new indices
    add_index :users, [:uid, :provider], unique: true
    add_index :users, :confirmation_token, unique: true
    # Add other indices as necessary
  end
end
