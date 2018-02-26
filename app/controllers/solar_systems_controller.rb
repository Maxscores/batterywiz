class SolarSystemsController < ApplicationController
  before_action :calculate_array_size

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

  def edit
    @solar_system = SolarSystem.find(params[:id])
  end

  def update
    solar_system = SolarSystem.find(params[:id])
    if solar_system.update(system_params)
      solar_system.installation.production.destroy if solar_system.installation.production
      solar_system.installation.find_or_get_production_data
      flash[:success] = "The Solar System was Successfully Updated"
      redirect_to installations_path
    else
      flash[:message] = "The Solar System was unable to be updated"
      redirect_to edit_solar_system_path(params[:id])
    end
  end

  private
    def system_params
      params.require(:solar_system).permit(:capacity, :module_type, :losses, :array_type, :tilt, :azimuth)
    end

    def calculate_array_size
      @size = Installation.find(session[:installation_id]).calculate_array_size
    end
end
