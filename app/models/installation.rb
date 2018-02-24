class Installation < ApplicationRecord
  validates_presence_of :zipcode
  belongs_to :user, optional: true
  has_one :solar_system
  has_one :consumption
  has_one :production

  def find_or_get_production_data(system_details)
    if production
      production
    else
      production = ProductionBuilder.build do |production|
        projection = NrelService.get_estimated_performance(system_details)
        production.set_installation(self)
        production.set_station(projection[:station_info][:location])
        production.set_station_city(projection[:station_info][:city])
        production.set_station_state(projection[:station_info][:state])
        production.set_ac_output(projection[:outputs][:ac_monthly])
        production.set_dc_output(projection[:outputs][:dc_monthly])
      end
      production.save!
      production
    end
  end

  def calculate_array_size
    average_daily_solar_production = MonthlySolarOutput.find_or_get_by_zipcode(zipcode).avg_daily_production
    grouped = consumption.avg_daily_consumption.zip(average_daily_solar_production)
    grouped.map do |(consumption, production)|
      (1.20 * consumption / production)
    end.max.round(1)
  end
end
