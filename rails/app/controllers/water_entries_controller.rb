class WaterEntriesController < ApplicationController
  def new
    @entry = WaterEntry.new
  end

  def create
    @entry = WaterEntry.new(entry_params)
    if @entry.save
      redirect_to day_path(@entry.occurred_on)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def entry_params
    params.require(:water_entry).permit(:amount, :occurred_on)
      .merge(user: current_user)
  end
end
