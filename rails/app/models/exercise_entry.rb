class ExerciseEntry < ApplicationRecord
  validates :name, :occurred_on, presence: true

  belongs_to :user

  encrypts :name

  scope :recent, -> { distinct(:name).order(created_at: :desc).limit(3) }
end
