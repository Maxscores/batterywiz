class Production
  attr_reader :station,
              :station_city,
              :station_state,
              :jan,
              :feb,
              :mar,
              :apr,
              :may,
              :jun,
              :jul,
              :aug,
              :sep,
              :oct,
              :nov,
              :dec

  def initialize(params)
    @station = params[:station_info][:location]
    @station_city = params[:station_info][:city]
    @station_state = params[:station_info][:state]
    @jan = params[:outputs][:ac_monthly][0].round(2)
    @feb = params[:outputs][:ac_monthly][1].round(2)
    @mar = params[:outputs][:ac_monthly][2].round(2)
    @apr = params[:outputs][:ac_monthly][3].round(2)
    @may = params[:outputs][:ac_monthly][4].round(2)
    @jun = params[:outputs][:ac_monthly][5].round(2)
    @jul = params[:outputs][:ac_monthly][6].round(2)
    @aug = params[:outputs][:ac_monthly][7].round(2)
    @sep = params[:outputs][:ac_monthly][8].round(2)
    @oct = params[:outputs][:ac_monthly][9].round(2)
    @nov = params[:outputs][:ac_monthly][10].round(2)
    @dec = params[:outputs][:ac_monthly][11].round(2)
  end

  def self.get(params)
    Production.new(NrelService.get_estimated_performance(params))
  end

end
