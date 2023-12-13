class RemoveAmountFromWaterEntries < ActiveRecord::Migration[7.1]
  def change
    remove_column :water_entries, :amount, :integer, null: false, default: 0
  end
end
