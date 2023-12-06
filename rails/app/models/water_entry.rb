class WaterEntry < ApplicationRecord
  validates :amount, numericality: {greater_than_or_equal_to: 0}
  validates :occurred_on, presence: true

  belongs_to :user
end
