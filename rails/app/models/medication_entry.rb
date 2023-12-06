class MedicationEntry < ApplicationRecord
  validates :name, :occurred_on, presence: true

  belongs_to :user
end
