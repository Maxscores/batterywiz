class ConsumptionsController < ApplicationController
  def new
    @consumption = Consumption.new
  end

  def create
    consumption = Consumption.new(consumption_params)
    consumption.installation_id = session[:installation_id]
    if consumption.save
      redirect_to new_solar_system_path
    else
      flash[:message] = "The Build Failed, please make sure require fields are filled and  try again"
      redirect_to new_consumption_path
    end
  end


  private
    def consumption_params
      params.require(:consumption).permit(:jan, :feb, :mar, :apr, :may, :jun, :jul, :aug, :sep, :oct, :nov, :dec)
    end

end
