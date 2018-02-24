class Api::V1::MonthlySolarController < Api::V1::BaseController
  def show
    monthly_solar_output = MonthlySolarOutput.find_or_get_by_zipcode(params[:zipcode])
    render json: monthly_solar_output
  end
end
