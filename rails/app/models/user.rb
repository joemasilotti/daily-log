class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true

  normalizes :email, with: -> { _1.strip.downcase }

  has_many :exercise_entries
  has_many :medication_entries
  has_many :water_entries
  has_many :food_entries

  encrypts :email, deterministic: true, downcase: true
end
