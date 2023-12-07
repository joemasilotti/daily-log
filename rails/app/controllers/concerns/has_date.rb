module HasDate
  extend ActiveSupport::Concern

  included do
    before_action :set_date
  end

  def set_date
    @date = Date.parse(params[:date].to_s)
  rescue Date::Error
    @date = Date.current
  end
end
