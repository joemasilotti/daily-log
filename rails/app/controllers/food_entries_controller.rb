class FoodEntriesController < ApplicationController
  include HasDate

  def new
    @entry = FoodEntry.new
    @tags = current_user.tags
  end

  def create
    @entry = FoodEntry.new(entry_params)
    if @entry.save
      redirect_to day_path(@entry.occurred_on), notice: "Added #{@entry.name}"
    else
      @tags = current_user.tags
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @entry = current_user.food_entries.find(params[:id])
    @tags = current_user.tags
  end

  def update
    @entry = current_user.food_entries.find(params[:id])
    if @entry.update(entry_params)
      redirect_to day_path(@entry.occurred_on), notice: "Updated #{@entry.name}"
    else
      @tags = current_user.tags
      render :new, status: :unprocessable_entity
    end
  end

  private

  def entry_params
    params.require(:food_entry).permit(:name, :occurred_on, :out, tag_ids: [])
      .merge(user: current_user)
  end
end
