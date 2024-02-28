class FoodEntry < ApplicationRecord
  validates :name, :occurred_on, presence: true
  validates :out, inclusion: [true, false]

  belongs_to :user

  encrypts :name

  scope :recent, -> { distinct(:name).order(created_at: :desc).limit(3) }
end