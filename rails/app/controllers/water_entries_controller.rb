class WaterEntriesController < ApplicationController
  include HasDate

  def new
    @entry = WaterEntry.new
    @recent_amounts = current_user.water_entries.recent_amounts
  end

  def create
    @entry = WaterEntry.new(entry_params)
    if @entry.save
      redirect_to day_path(@entry.occurred_on), notice: "Added #{@entry.amount} oz of water"
    else
      @recent_amounts = current_user.water_entries.recent_amounts
      render :new, status: :unprocessable_entity
    end
  end

  private

  def entry_params
    params.require(:water_entry).permit(:amount, :occurred_on)
      .merge(user: current_user)
  end
end
