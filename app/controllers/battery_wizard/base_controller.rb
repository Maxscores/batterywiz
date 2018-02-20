class BatteryWizard::BaseController < ApplicationController
  def set_installation
    @installation = Installation.find(params[:id])
  end

end
