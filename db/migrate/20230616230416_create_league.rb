class CreateLeague < ActiveRecord::Migration[7.0]
  def change  
    create_table :leagues do |t|
      t.integer :edition_number
      t.string :package
      t.integer :price
      t.timestamps
    end

    create_table :players do |t|
      t.belongs_to :league, index: true
      t.belongs_to :tournament, index: true
      t.string :name
      t.string :email
      t.string :phone
      t.timestamps
    end 

    create_table :league_sponsors do |t|
      t.belongs_to :league, index: true
      t.string :name
      t.string :description
      t.timestamps
    end

    create_table :general_classifications do |t|
      t.belongs_to :league, index: true
      t.string :name
      t.string :description
      t.timestamps
    end

    create_table :general_rewards do |t|
      t.belongs_to :general_classification, index: true
      t.string :name
      t.string :description
      t.string :winner
      t.timestamps
    end

    create_table :other_classifications do |t|
      t.belongs_to :league, index: true
      t.string :name
      t.string :description
      t.timestamps
    end

    create_table :classification_types do |t|
      t.belongs_to :other_classification, index: true
      t.string :name
      t.string :description
      t.timestamps
    end

    create_table :other_rewards do |t|
      t.belongs_to :classification_type, index: true
      t.string :name
      t.string :description
      t.string :winner
      t.timestamps
    end

    create_table :tournaments do |t|
      t.belongs_to :league, index: true
      t.date :date
      t.string :place
      t.string :name
      t.integer :num_rounds
      t.integer :cost
      t.integer :additional_costs
      t.string :formula
      t.string :sponser
      t.string :package
      t.integer :min_players
      t.integer :max_players
      t.string :hcp
      t.timestamps
    end

    create_table :extra_contests do |t|
      t.belongs_to :tournament, index: true
      t.string :name
      t.string :description
      t.string :prize
      t.string :hole
      t.string :sponsor
      t.timestamps
    end

    create_table :results do |t|
      t.belongs_to :tournament, index: true
      t.string :classification
      t.string :prize
      t.timestamps
    end 

    create_table :rounds do |t|
      t.belongs_to :tournament, index: true
      t.date :date
      t.string :description
      t.string :place
      t.string :golf_course
      t.integer :num_rounds
      t.string :hcp
      t.string :criteria
      t.timestamps
    end 

    create_table :round_contests do |t|
      t.belongs_to :round, index: true
      t.string :name
      t.string :description
      t.string :prize
      t.string :hole
      t.string :sponsor
      t.timestamps
    end

    create_table :round_results do |t|
      t.belongs_to :round, index: true
      t.string :classification
      t.string :prize
      t.timestamps
    end

    create_table :flights do |t|
      t.belongs_to :round, index: true
      t.string :tee_time
      t.string :hole
      t.timestamps
    end
  end
end
