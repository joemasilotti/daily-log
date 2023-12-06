class MedicationEntriesController < ApplicationController
  def new
    @entry = MedicationEntry.new
  end

  def create
    @entry = MedicationEntry.new(entry_params)
    if @entry.save
      redirect_to day_path(@entry.occurred_on)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def entry_params
    params.require(:medication_entry).permit(:name, :occurred_on)
  end
end
