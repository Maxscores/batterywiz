class SolarController < ApplicationController
  def show
    # @estimate = NrelService.new().get_estimated_performance(params)
    # @utility_rates = OpenEiService.new().get_utility_rates(params)
  end

  def consumption
    @categories = Category.all
    render "solar/consumption"
  end

  def system
    render "solar/system"
  end

end
