class SettingsController < ApplicationController
  def edit
    @settings = current_user.settings
  end

  def update
    @settings = current_user.settings
    if @settings.update(settings_params)
      redirect_to settings_path, notice: "Settings updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def settings_params
    params.require(:setting).permit(:time_zone)
  end
end
