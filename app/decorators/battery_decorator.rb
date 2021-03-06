class BatteryDecorator < SimpleDelegator
  # def graphable_daily_net_energy
  #   start_day = Time.new("01-01")
  #   daily_net_energy.reduce([]) do |formatted, energy|
  #     if formatted.empty?
  #       formatted << [start_day, energy]
  #     else
  #       formatted << [start_day, formatted[-1][1] + energy]
  #     end
  #     start_day += 1.day
  #     formatted
  #   end
  # end

  def graph_formatter(day_of_year)
    start_hour = Time.new("00:00:00")
    hourly_net_energy[day_of_year].reduce([]) do |formatted, energy|
      if formatted.empty?
        formatted << [start_hour, 25]
      else
        if energy < 0 && formatted[-1][1] > 0
          formatted << [start_hour, formatted[-1][1] + 100 * energy / capacity]
        elsif formatted[-1][1] >= 100
          formatted << [start_hour, 100]
        elsif energy > 0 || !formatted[-1][1].zero?
          if (formatted[-1][1] + 100 * energy / capacity) >= 100
            formatted << [start_hour, 100]
          else
            formatted << [start_hour, formatted[-1][1] + 100 * energy / capacity]
          end
        else
          formatted << [start_hour, formatted[-1][1]]
        end
      end
      # formatted << [start_hour, energy]
      start_hour += 1.hour
      formatted
    end
  end

  def net_on_spring_equinox
    graph_formatter(78)
  end

  def net_on_summer_solstice
    graph_formatter(171)
  end

  def net_on_fall_equinox
    graph_formatter(264)
  end

  def net_on_winter_solstice
    graph_formatter(354)
  end
end
