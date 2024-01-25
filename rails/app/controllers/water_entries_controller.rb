class WaterEntriesController < ApplicationController
  include HasDate

  def new
    @entry = WaterEntry.new
    @recent_entries = current_user.water_entries.recent
  end

  def create
    @entry = WaterEntry.new(entry_params)
    if @entry.save
      redirect_to day_path(@entry.occurred_on), notice: "Added #{@entry.amount} of water"
    else
      @recent_entries = current_user.water_entries.recent
      render :new, status: :unprocessable_entity
    end
  end

  def recent
    # Assuming 'recent_water_entries' is a method to retrieve recent water entries based on the previous code
    @recent_water_entries = recent_entries("water")
  end
  
  private

  def entry_params
    params.require(:water_entry).permit(:amount_value, :amount_unit, :occurred_on).merge(user: current_user)
  end

  def current_day
    Time.zone.now.to_date
  end

  def recent_quick_add
    # Assuming task is passed as a parameter
    task = params[:amount_unit]

    # Step 1: Retrieve previous day's entries for the specific task
    previous_day_entries = WaterEntry.where(task: task, occurred_on: (current_day - 1).beginning_of_day..(current_day - 1).end_of_day)

    # Step 2: Remove duplicates
    unique_previous_day_entries = previous_day_entries.uniq(&:amount_unit)

    # Step 3: Exclude entries already added today for the specific task
    current_day_entries = WaterEntry.where(task: task, occurred_on: current_day.beginning_of_day..current_day.end_of_day)
    new_entries = unique_previous_day_entries.reject { |entry| current_day_entries.exists?(task: entry.task) }

    # Step 4: Sort by most recent
    sorted_entries = new_entries.sort_by(&:occurred_on).reverse

    # Step 5: Limit to 3 entries
    quick_add_entries = sorted_entries.take(3)

    render 'quick_add_entries'
  end
end


