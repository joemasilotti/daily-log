class ExerciseEntriesController < ApplicationController
  def new
    @entry = ExerciseEntry.new
  end

  def create
    @entry = ExerciseEntry.new(entry_params)
    if @entry.save
      redirect_to day_path(@entry.occurred_on)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def entry_params
    params.require(:exercise_entry).permit(:name, :occurred_on)
      .merge(user: current_user)
  end
end
