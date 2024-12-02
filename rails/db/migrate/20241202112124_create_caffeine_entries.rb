class CreateCaffeineEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :caffeine_entries do |t|
      t.string :name, null: false
      t.date :occurred_on, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
