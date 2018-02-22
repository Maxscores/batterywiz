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
    @production ||= Production.get(system_to_estimate)
  end

  def utility_rate
    @utility_rate ||= find_utility_rate_by_zipcode(installation.zipcode)
  end


  private
    def find_utility_rate_by_zipcode(zipcode)
      if utility_rate = BasicUtilityRate.find_by(zipcode: zipcode)
        utility_rate
      else
        BasicUtilityRate.get(zipcode)
      end
    end
end
