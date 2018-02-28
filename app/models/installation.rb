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
    grouped = consumption.avg_daily_consumption_by_month.zip(average_daily_solar_production)
    grouped.map do |(consumption, production)|
      (1.15 * consumption / production)
    end.max.round(2)
  end

  def estimate_hourly_net_energy
    calculate_hourly_net(consumption.estimated_hourly_consumption, production.hourly_production_by_day)
  end
end
