class SolarSystem < ApplicationRecord
  belongs_to :installation
  before_save :build_production, :build_battery

  validates_presence_of :capacity, :module_type, :losses, :array_type, :tilt, :azimuth

  enum array_type: ["Fixed - Open Rack", "Fixed - Roof Mounted", "1-Axis", "1-Axis Backtracking", "2-Axis"]
  enum module_type: ["Standard", "Premium", "Thin Film"]

  def build_production
    installation.production.destroy if installation.production
    estimated_performance = NrelService.get_estimated_performance(system_details)
    new_production = ProductionBuilder.build do |production|
      production.set_installation(installation)
      production.set_station(estimated_performance[:station_info][:location])
      production.set_station_city(estimated_performance[:station_info][:city])
      production.set_station_state(estimated_performance[:station_info][:state])
      production.set_ac_monthly(estimated_performance[:outputs][:ac_monthly])
      production.set_dc_monthly(estimated_performance[:outputs][:dc_monthly])
      production.set_ac_hourly(estimated_performance[:outputs][:ac])
      production.set_dc_hourly(estimated_performance[:outputs][:dc])
    end
    new_production.save!
  end

  def build_battery
    installation.battery.destroy if installation.battery
    Battery.create(capacity: installation.estimate_battery_size.round(1), installation: installation)
  end

  def system_details
    attributes.merge!('zipcode' => installation.zipcode).symbolize_keys
  end
end
