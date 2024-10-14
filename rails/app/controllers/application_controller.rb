class ApplicationController < ActionController::Base
  include Authentication

  before_action :authenticate_user!

  around_action :set_time_zone, if: :user_signed_in?

  def set_time_zone(&block)
    Time.use_zone(current_user.settings.time_zone, &block)
  end
end
