class InstallationPresenter
  attr_reader :installation,
              :solar_system,
              :consumption,
              :production,
              :utility_rate,
              :battery

  def initialize(installation_id)
    @installation = Installation.includes(:solar_system, :consumption, :production, :battery).find(installation_id)
    @solar_system = @installation.solar_system
    @consumption = ConsumptionDecorator.new(@installation.consumption)
    @production = ProductionDecorator.new(@installation.production)
    @utility_rate = BasicUtilityRate.find_or_get_utility_rate_by_zipcode(installation.zipcode)
    @battery = BatteryDecorator.new(@installation.battery)
  end
end
