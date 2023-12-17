class AddFeatureFlagsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :features, :string, array: true, null: false, default: []
  end
end
