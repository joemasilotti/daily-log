class DaysController < ApplicationController
  def index
    redirect_to day_path(Date.today)
  end

  def show
    @date = date
    @exercise_entries = ExerciseEntry.where(occurred_on: date)
    @medication_entries = MedicationEntry.where(occurred_on: date)
    @water = WaterEntry.where(occurred_on: date).sum(:amount)
    @food_entries = FoodEntry.where(occurred_on: date)
  end

  private

  def date
    Date.parse(params[:id]) || Date.today
  end
end