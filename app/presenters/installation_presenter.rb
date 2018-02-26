class InstallationPresenter
  attr_reader :installation, :solar_system, :consumption

  def initialize(installation_id)
    @installation = Installation.includes(:solar_system, :consumption, :production).find(installation_id)
    @solar_system = @installation.solar_system
    @consumption = @installation.consumption
    @production = nil
    @utility_rate = nil
  end

  def production
    @production ||= @installation.find_or_get_production_data
  end

  def utility_rate
    @utility_rate ||= BasicUtilityRate.find_or_get_utility_rate_by_zipcode(installation.zipcode)
  end
end
