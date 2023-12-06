class FoodEntriesController < ApplicationController
  def new
    @entry = FoodEntry.new
  end

  def create
    @entry = FoodEntry.new(entry_params)
    if @entry.save
      redirect_to day_path(@entry.occurred_on)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def entry_params
    params.require(:food_entry).permit(:name, :out, :occurred_on)
      .merge(user: current_user)
  end
end
