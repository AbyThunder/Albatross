class CreateAcademy < ActiveRecord::Migration[7.0]
  def change
    create_table :academies do |t|
      t.integer :edition_number
      t.string :package
      t.timestamps
    end

    create_table :candidates do |t|
      t.belongs_to :academy, index: true
      t.string :name
      t.string :status
      t.string :email
      t.string :phone
      t.timestamps
    end 

    create_table :schedules do |t|
      t.belongs_to :academy, index: true
      t.date :date
      t.string :description
      t.timestamps
    end 

    create_table :sponsors do |t|
      t.belongs_to :academy, index: true
      t.string :name
      t.string :description
      t.timestamps
    end 

    create_table :lessons do |t|
      t.belongs_to :academy, index: true
      t.date :date
      t.string :place
      t.string :description
      t.string :freebie
      t.timestamps
    end

    create_table :trainers do |t|
      t.belongs_to :lesson, index: true
      t.string :name
      t.string :description
      t.timestamps
    end

    create_table :competitions do |t|
      t.belongs_to :lesson, index: true
      t.string :name
      t.string :description
      t.string :prize
      t.timestamps
    end

    create_table :trainers_lessons, id: false do |t|
      t.belongs_to :trainer, index: true
      t.belongs_to :lesson, index: true
    end

    create_table :academies_sponsors, id: false do |t|
      t.belongs_to :sponsor, index: true
      t.belongs_to :academy, index: true
    end

    create_table :lessons_academies, id: false do |t|
      t.belongs_to :lesson, index: true
      t.belongs_to :academy, index: true
    end

    create_table :candidates_lessons, id: false do |t|
      t.belongs_to :candidate, index: true
      t.belongs_to :lesson, index: true
    end
  end
end
