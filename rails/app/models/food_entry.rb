class FoodEntry < ApplicationRecord
  validates :name, :occurred_on, presence: true
  validates :out, inclusion: [true, false]

  belongs_to :user

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  encrypts :name
end
