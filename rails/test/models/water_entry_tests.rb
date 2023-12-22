require "test_helper"

class WaterEntryTest < ActiveSupport::TestCase
  test "sorting by recent entries returns unique entries" do
    user.water_entries.create!(amount_value: 20, amount_unit: "oz", occurred_on: Date.yesterday)
    second_twenty_oz = user.water_entries.create!(amount_value: 20, amount_unit: "oz", occurred_on: Date.today)
    sixteen_oz = user.water_entries.create!(amount_value: 16, amount_unit: "oz", occurred_on: Date.tomorrow)

    assert_equal [sixteen_oz, second_twenty_oz], user.water_entries.recent
  end

  def user
    @user ||= User.create!(email: "user@example.com", password: "password")
  end
end
