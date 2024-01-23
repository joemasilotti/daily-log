class WaterEntry < ApplicationRecord
  validates :occurred_on, presence: true
  validates :amount, presence: true
  validates :amount, measured: {greater_than: 0}

  belongs_to :user

  scope :recent, -> { distinct(:amount).order(created_at: :desc).limit(3) }
  scope :amounts, -> { map(&:amount).presence || [Measured::Volume.new(0, :oz)] }

  measured_volume :amount

  def self.units
    {
      imperial: "oz",
      metric: "ml"
    }
  end
end






