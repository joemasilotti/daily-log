class Setting < ApplicationRecord
  belongs_to :user

  validates :time_zone, time_zone: true
end
