class AlcoholEntriesController < ApplicationController
  include HasDate

  def new
    @entry = AlcoholEntry.new
  end

  def create
    @entry = AlcoholEntry.new(entry_params)
    if @entry.save
      redirect_to day_path(@entry.occurred_on), notice: "Added #{@entry.name}"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @entry = current_user.alcohol_entries.find(params[:id])
  end

  def update
    @entry = current_user.alcohol_entries.find(params[:id])
    if @entry.update(entry_params)
      redirect_to day_path(@entry.occurred_on), notice: "Updated #{@entry.name}"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def entry_params
    params.require(:alcohol_entry).permit(:name, :occurred_on)
          .merge(user: current_user)
  end
end
