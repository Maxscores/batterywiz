module BatteryCalculationModule
  include ConsumptionProfileModule

  def calculate_hourly_net_energy(hourly_consumption, hourly_production)
    hourly_consumption.zip(hourly_production.each_slice(24).to_a).map do |(day_hourly_consumption, day_hourly_production)|
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

  def estimate_consumption(avg_daily_consumption)
    (1..12).map do |month|
      (1..Time.days_in_month(month)).map do
        default_consumption_profile.map do |hour_consumption|
          avg_daily_consumption[month-1] * hour_consumption
        end
      end
    end.flatten(1)
  end
end
