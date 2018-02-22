class InstallationPresenter
  attr_reader :installation, :solar_system, :consumption

  def initialize(installation_id)
    @installation = Installation.find(installation_id)
    @solar_system = @installation.solar_system
    @consumption = @installation.consumption
    @production = nil
    @utility_rate = nil
  end

  def production
    system_to_estimate = solar_system.attributes.merge!('zipcode' => installation.zipcode)
    @production ||= find_or_get_production_data(system_to_estimate.symbolize_keys)
  end

  def utility_rate
    @utility_rate ||= find_or_get_utility_rate_by_zipcode(installation.zipcode)
  end


  private
    def find_or_get_utility_rate_by_zipcode(zipcode)
      if utility_rate = BasicUtilityRate.find_by(zipcode: zipcode)
        utility_rate
      else
        BasicUtilityRate.get(zipcode)
      end
    end

    def find_or_get_production_data(system_details)
      if installation.production
        installation.production
      else
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
end
