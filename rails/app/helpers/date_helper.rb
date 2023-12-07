module DateHelper
  def prev_day_path(date)
    day_path(date - 1.day)
  end

  def next_day_path(date)
    day_path(date + 1.day)
  end
end
