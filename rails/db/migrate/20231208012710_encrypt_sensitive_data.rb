class EncryptSensitiveData < ActiveRecord::Migration[7.1]
  def change
    User.find_each { _1.encrypt }
    ExerciseEntry.find_each { _1.encrypt }
    FoodEntry.find_each { _1.encrypt }
    MedicationEntry.find_each { _1.encrypt }
  end
end
