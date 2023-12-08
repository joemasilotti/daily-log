class ExerciseEntry < ApplicationRecord
  validates :name, :occurred_on, presence: true

  belongs_to :user

  encrypts :name
end
