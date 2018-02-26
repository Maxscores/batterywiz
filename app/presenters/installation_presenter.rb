class InstallationPresenter
  attr_reader :installation, :solar_system, :consumption, :production, :utility_rate

  def initialize(installation_id)
    @installation = Installation.includes(:solar_system, :consumption, :production).find(installation_id)
    @solar_system = @installation.solar_system
    @consumption = @installation.consumption
    @production = @installation.production
    @utility_rate = BasicUtilityRate.find_or_get_utility_rate_by_zipcode(installation.zipcode)
  end
end
