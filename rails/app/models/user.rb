class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true

  normalizes :email, with: -> { _1.strip.downcase }

  has_many :exercise_entries, dependent: :destroy
  has_many :medication_entries, dependent: :destroy
  has_many :water_entries, dependent: :destroy
  has_many :food_entries, dependent: :destroy
  has_many :caffeine_entries, dependent: :destroy

  has_one :settings, dependent: :destroy, class_name: 'Setting'

  after_create_commit :create_settings!

  encrypts :email, deterministic: true, downcase: true

  def to_honeybadger_context
    {
      user_id: id,
      user_email: email
    }
  end
end
