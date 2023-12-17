namespace :tags do
  desc "Migrate existing food entries eaten 'out' to a tag."
  task migrate: :environment do
    User.with_feature("tags").find_each do |user|
      out_entries = user.food_entries.where(out: true)
      if out_entries.any?
        tag = user.tags.create!(name: "Out", description: "Ate this meal out")
        out_entries.find_each do |entry|
          entry.tags << tag
          entry.update!(out: false)
        end
      end
    end
  end
end
