class AddSettings < ActiveRecord::Migration[7.1]
  def change
    create_table :settings do |t|
      t.belongs_to :user, null: false
      t.string :time_zone, null: false, default: "Pacific Time (US & Canada)"

      t.timestamps
    end

    User.find_each(&:create_settings!)
  end
end
