class BatteryWizardController < ApplicationController
  def show
    # @estimate = NrelService.new().get_estimated_performance(params)
    # @utility_rates = OpenEiService.new().get_utility_rates(params)
  end

  def new
    render "battery_wizard/installation"
  end

  def consumption
    @categories = Category.all
    render "battery_wizard/consumption"
  end

  def system
    render "battery_wizard/system"
  end

end