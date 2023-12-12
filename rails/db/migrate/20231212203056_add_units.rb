class AddUnits < ActiveRecord::Migration[7.1]
  def change
    add_column :water_entries, :amount_value, :decimal, precision: 10, scale: 2
    add_column :water_entries, :amount_unit, :string, limit: 12

    WaterEntry.find_each do |entry|
      entry.amount_value = entry.amount_before_type_cast
      entry.amount_unit = "oz"
      entry.save!
    end

    add_column :settings, :measurement_system, :string, null: false, default: "imperial"
  end
end
