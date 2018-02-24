class SolarSystemsController < ApplicationController
  def new
    @solar_system = SolarSystem.new
  end

  def create
    solar_system = SolarSystem.new(system_params)
    solar_system.installation_id = session[:installation_id]
    if solar_system.save
      redirect_to installation_path(session[:installation_id])
    else
      flash[:message] = "The Build Failed, please make sure require fields are filled and  try again"
      redirect_to new_solar_system_path
    end
  end

  def system_params
    params.require(:solar_system).permit(:capacity, :module_type, :losses, :array_type, :tilt, :azimuth)
  end
end
