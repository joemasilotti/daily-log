class CreateInitialTables < ActiveRecord::Migration[7.1]
  def change
    create_table :exercise_entries do |t|
      t.string :name, null: false
      t.date :occurred_on, null: false

      t.timestamps
    end

    create_table :medication_entries do |t|
      t.string :name, null: false
      t.date :occurred_on, null: false

      t.timestamps
    end

    create_table :water_entries do |t|
      t.integer :amount, null: false, default: 0
      t.date :occurred_on, null: false

      t.timestamps
    end

    create_table :food_entries do |t|
      t.string :name, null: false
      t.boolean :out, null: false, default: false
      t.date :occurred_on, null: false

      t.timestamps
    end
  end
end
