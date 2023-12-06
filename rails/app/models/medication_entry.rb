class MedicationEntry < ApplicationRecord
  validates :name, :occurred_on, presence: true
end
