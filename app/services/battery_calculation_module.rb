module BatteryCalculationModule
  def calculate_capacity(hourly_consumption, hourly_production)
    hourly_consumption.zip(hourly_production.each_slice(24).to_a).map do |(day_hourly_consumption, day_hourly_production)|
      day_hourly_consumption.zip(day_hourly_production).map do |(hour_consumption, hour_production)|
        (hour_production/1000) - hour_consumption
      end.sum
    end.max * 24
  end

  def default_consumption_profile
    [
      3.9/60.7,
      3.1/60.7,
      2.0/60.7,
      1.2/60.7,
      1.1/60.7,
      1.0/60.7,
      0.9/60.7,
      1.1/60.7,
      1.2/60.7,
      1.4/60.7,
      1.9/60.7,
      2.1/60.7,
      2.5/60.7,
      2.5/60.7,
      2.7/60.7,
      3.5/60.7,
      3.5/60.7,
      3.8/60.7,
      4.4/60.7,
      3.9/60.7,
      3.6/60.7,
      3.5/60.7,
      3.5/60.7,
      2.4/60.7
    ]
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