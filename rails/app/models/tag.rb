class Tag < ApplicationRecord
  belongs_to :user

  has_many :taggings, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: {scope: :user_id}
end
