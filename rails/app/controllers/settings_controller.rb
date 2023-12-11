class SettingsController < ApplicationController
  def edit
    @settings = current_user.settings
  end

  def update
    @settings = current_user.settings
    if @settings.update(settings_params)
      redirect_after_update
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def settings_params
    params.require(:setting).permit(:time_zone)
  end

  def redirect_after_update
    if turbo_native_app?
      redirect_to turbo_recede_historical_location_path
    else
      redirect_to settings_path, notice: "Settings updated"
    end
  end
end
