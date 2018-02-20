class BatteryWizard::ConsumptionController < BatteryWizard::BaseController
  def new
    @categories = Category.all
  end

end
