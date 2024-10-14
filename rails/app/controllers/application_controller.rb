class ApplicationController < ActionController::Base
  include Authentication
  include HoneybadgerContext

  before_action :authenticate_user!
  before_action :set_honeybadger_context

  around_action :set_time_zone, if: :user_signed_in?

  def set_time_zone(&block)
    Time.use_zone(current_user.settings.time_zone, &block)
  end
end
