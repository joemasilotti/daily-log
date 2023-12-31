class TimeZoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless ActiveSupport::TimeZone[value].present?
      record.errors.add(attribute, (options[:message] || "is not a valid time zone"))
    end
  end
end
