class SolarController < ApplicationController
  def show
    @estimate = NrelService.new().get_estimated_performance(params)
    @utility_rates = OpenEiService.new().get_utility_rates(params)
  end

  def form
    render "solar/form"
  end
end
