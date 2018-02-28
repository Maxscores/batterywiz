module BatteryCalculationModule

  def calculate_hourly_net(hourly_consumption_by_day, hourly_production_by_day)
    hourly_consumption_by_day.zip(hourly_production_by_day).map do |(day_hourly_consumption, day_hourly_production)|
      day_hourly_consumption.zip(day_hourly_production).map do |(hour_consumption, hour_production)|
        ((hour_production/1000) - hour_consumption).round(1)
      end
    end
  end

  def calculate_daily_net(hourly_net_energy)
    hourly_net_energy.map do |day|
      day.sum.round(1)
    end
  end
end
