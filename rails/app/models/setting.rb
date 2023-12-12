class Setting < ApplicationRecord
  belongs_to :user

  validates :time_zone, time_zone: true

  enum measurement_system: {
    imperial: "imperial",
    metric: "metric"
  }

  def water_unit
    WaterEntry.units[measurement_system.to_sym]
  end
end
