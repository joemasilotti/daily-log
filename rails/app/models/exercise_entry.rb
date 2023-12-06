class ExerciseEntry < ApplicationRecord
  validates :name, :occurred_on, presence: true
end
