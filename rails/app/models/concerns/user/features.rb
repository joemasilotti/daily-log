module User::Features
  extend ActiveSupport::Concern

  included do
    attribute :features, :string, array: true, default: []

    scope :with_feature, ->(feature) { where("features @> ARRAY[?]::varchar[]", feature.to_s.downcase) }

    def has_feature?(feature)
      features.include?(feature.to_s.downcase)
    end

    def enable_feature!(feature)
      features << feature.to_s.downcase unless has_feature?(feature)
      save!
    end

    def disable_feature!(feature)
      features.delete(feature.to_s.downcase)
      save!
    end
  end
end
