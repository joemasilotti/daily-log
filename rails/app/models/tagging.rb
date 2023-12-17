class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :food_entry

  validates :food_entry_id, uniqueness: {scope: :tag_id}
end
