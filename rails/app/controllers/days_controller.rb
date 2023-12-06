class DaysController < ApplicationController
  before_action :set_date

  def index
    redirect_to day_path(Date.today)
  end

  def show
    @exercise_entries = ExerciseEntry.where(occurred_on: @date)
    @medication_entries = MedicationEntry.where(occurred_on: @date)
    @water = WaterEntry.where(occurred_on: @date).sum(:amount)
    @food_entries = FoodEntry.where(occurred_on: @date)
  end

  private

  def set_date
    @date = Date.parse(params[:id].to_s)
  rescue Date::Error
    redirect_to day_path(Date.today)
  end
end
