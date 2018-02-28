class ProductionDecorator < SimpleDelegator
  # def graphable_daily_production
  #   start_day = Time.new("01-01")
  #   daily_production.map do |energy|
  #     formatted = [start_day, energy/1000]
  #     start_day += 1.day
  #     formatted
  #   end
  # end

  def graph_monthly_production
    start_month = Time.new("01-01-01")
    (1..12).map do |month|
      formatted = [start_month, production_by_month[month-1]]
      start_month += 1.month
      formatted
    end
  end

  def graph_formatter(day_of_year)
    start_hour = Time.new("00:00:00")
    hourly_production_by_day[day_of_year].reduce([]) do |formatted, energy|
      if formatted.empty?
        formatted << [start_hour, energy/1000]
      else
        formatted << [start_hour, formatted[-1][1] + energy/1000]
      end
      # formatted << [start_hour, energy/1000]
      start_hour += 1.hour
      formatted
    end
  end

  def production_on_spring_equinox
    graph_formatter(78)
  end

  def production_on_summer_solstice
    graph_formatter(171)
  end

  def production_on_fall_equinox
    graph_formatter(264)
  end

  def production_on_winter_solstice
    graph_formatter(354)
  end
end
