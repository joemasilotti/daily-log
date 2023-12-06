class AssociateEntriesWithUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :exercise_entries, :user, foreign_key: true, null: false
    add_reference :medication_entries, :user, foreign_key: true, null: false
    add_reference :water_entries, :user, foreign_key: true, null: false
    add_reference :food_entries, :user, foreign_key: true, null: false
  end
end
