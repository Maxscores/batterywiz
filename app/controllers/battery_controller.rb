class BatteryController < ApplicationController
  def show
  end

  def new
    @installation = Installation.new()
    @categories = Category.all
  end

  def create
    installation = Installation.new(installation_params)
    installation.consumption = Consumption.new(consumption_params)
    installation.solar_system = SolarSystem.new(system_params)
    if installation.save!
      redirect_to battery_path(installation)
    else
      flash[:message] = "The Build Failed, please make sure require fields are filled and  try again"
      redirect_to new_battery_path
    end
  end

  private
    def installation_params
      params.require(:installation).permit(:zipcode)
    end

    def consumption_params
      params.require(:consumption).permit(:jan, :feb, :mar, :apr, :may, :jun, :jul, :aug, :sep, :oct, :nov, :dec)
    end

    def system_params
      params.require(:system).permit(:capacity, :module_type, :losses, :array_type, :tilt, :azimuth)
    end
end
