class CreateTagsAndTaggings < ActiveRecord::Migration[7.1]
  def change
    create_table :tags do |t|
      t.belongs_to :user
      t.string :name, null: false
      t.string :description

      t.timestamps
    end

    create_table :taggings do |t|
      t.belongs_to :tag
      t.belongs_to :food_entry

      t.timestamps
    end

    add_index :tags, [:user_id, :name], unique: true
    add_index :taggings, [:tag_id, :food_entry_id], unique: true
  end
end
