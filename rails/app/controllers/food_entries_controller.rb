class FoodEntriesController < ApplicationController
  include HasDate

  def new
    @entry = FoodEntry.new
    @recent_food_entries = current_user.food_entries.recent
  end

  def create
    @entry = FoodEntry.new(entry_params)
    if @entry.save
      redirect_to day_path(@entry.occurred_on), notice: "Added #{@entry.name}"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @entry = current_user.food_entries.find(params[:id])
  end

  def update
    @entry = current_user.food_entries.find(params[:id])
    if @entry.update(entry_params)
      redirect_to day_path(@entry.occurred_on), notice: "Updated #{@entry.name}"
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

