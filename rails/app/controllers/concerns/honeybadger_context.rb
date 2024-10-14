module HoneybadgerContext
  extend ActiveSupport::Concern

  def set_honeybadger_context
    Honeybadger.context(current_user)
  end

  def clear_honeybadger_context
    Honeybadger.context.clear!
  end
end
