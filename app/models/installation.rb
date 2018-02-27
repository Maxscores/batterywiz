class Installation < ApplicationRecord
  include BatteryCalculationModule

  validates_presence_of :zipcode
  belongs_to :user, optional: true
  has_one :solar_system
  has_one :consumption
  has_one :production
  has_one :battery

  def calculate_array_size
    average_daily_solar_production = MonthlySolarOutput.find_or_get_by_zipcode(zipcode).avg_daily_production
    grouped = consumption.avg_daily_consumption.zip(average_daily_solar_production)
    grouped.map do |(consumption, production)|
      (1.20 * consumption / production)
    end.max.round(1)
  end

  def estimate_hourly_net_energy
    estimated_consumption = estimate_consumption(consumption.avg_daily_consumption)
    calculate_hourly_net_energy(estimated_consumption, production.hourly_dc)
  end
end
