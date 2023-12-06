class FoodEntry < ApplicationRecord
  validates :name, :occurred_on, presence: true
  validates :out, inclusion: [true, false]

  belongs_to :user
end
