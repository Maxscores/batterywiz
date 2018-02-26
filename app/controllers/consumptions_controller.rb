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

  def edit
    @consumption = Consumption.find(params[:id])
  end

  def update
    if Consumption.find(params[:id]).update(consumption_params)
      flash[:success] = "The Consumption was Successfully Updated"
      redirect_to installations_path
    else
      flash[:message] = "The Consumption was unable to be updated"
      redirect_to edit_consumption_path(params[:id])
    end
  end


  private
    def consumption_params
      params.require(:consumption).permit(:jan, :feb, :mar, :apr, :may, :jun, :jul, :aug, :sep, :oct, :nov, :dec)
    end

end
