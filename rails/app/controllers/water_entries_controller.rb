class WaterEntriesController < ApplicationController
  include HasDate

  def new
    @entry = WaterEntry.new
    @recent_entries = current_user.water_entries.recent
  end

  def create
    @entry = WaterEntry.new(entry_params)
    if @entry.save
      redirect_to day_path(@entry.occurred_on), notice: "Added #{@entry.amount} of water"
    else
      @recent_entries = current_user.water_entries.recent
      render :new, status: :unprocessable_entity
    end
  end

  private

  def entry_params
    params.require(:water_entry).permit(:amount_value, :amount_unit, :occurred_on)
      .merge(user: current_user)
  end
end


