class ConsumptionDecorator < SimpleDelegator
  # def graphable_daily_consumption
  #   start_day = Time.new("01-01")
  #   daily_consumption.map do |energy|
  #     formatted = [start_day, energy]
  #     start_day += 1.day
  #     formatted
  #   end
  # end
  def daily_peak_consumption
    start_day = Time.new("01-01")
    calculate_daily_peak_consumption.map do |peak_consumption|
      formatted = [start_day, peak_consumption]
      start_day += 1.day
      formatted
    end
  end

  def graph_monthly_consumption
    start_month = Time.new("01-01")
    (1..12).map do |month|
      formatted = [start_month, monthly_consumption[month].to_i]
      start_month += 1.month
      formatted
    end
  end

  def graph_formatter(daily_total)
    start_hour = Time.new("00:00:00")
    (default_consumption_profile).reduce([]) do |formatted, energy|
      if formatted.empty?
        formatted << [start_hour, energy * daily_total]
      else
        formatted << [start_hour, formatted[-1][1] + energy * daily_total]
      end
      start_hour += 1.hour
      formatted
    end
  end

  def consumption_on_spring_equinox
    graph_formatter(avg_daily_consumption_by_month[2])
  end

  def consumption_on_summer_solstice
    graph_formatter(avg_daily_consumption_by_month[5])
  end

  def consumption_on_fall_equinox
    graph_formatter(avg_daily_consumption_by_month[8])
  end

  def consumption_on_winter_solstice
    graph_formatter(avg_daily_consumption_by_month[10])
  end
end
