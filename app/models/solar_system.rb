class SolarSystem < ApplicationRecord
  belongs_to :installation
  before_save :update_production

  validates_presence_of :capacity, :module_type, :losses, :array_type, :tilt, :azimuth

  enum array_type: ["Fixed - Open Rack", "Fixed - Roof Mounted", "1-Axis", "1-Axis Backtracking", "2-Axis"]
  enum module_type: ["Standard", "Premium", "Thin Film"]

  def update_production
    installation.production.destroy if installation.production
    system_details = attributes.merge!('zipcode' => installation.zipcode).symbolize_keys
    production = ProductionBuilder.build do |production|
      projection = NrelService.get_estimated_performance(system_details)
      production.set_installation(installation)
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
