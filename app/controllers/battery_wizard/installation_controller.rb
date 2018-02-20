class BatteryWizard::InstallationController < BatteryWizard::BaseController
  def new
    @installation = Installation.new()
  end

  def create
    installation = Installation.new(installation_params)
    if installation.save
      session[:installation_id] = installation.id
      redirect_to new_battery_wizard_consumption_path
    else
      flash[:message] = "Installation Creation Failed, check zipcode"
      redirect_to battery_wizard_installation_index_path
    end
  end

  private
    def installation_params
      params.require(:installation).permit(:zipcode)
    end
end
