class ProductionBuilder
  attr_reader :production

  def self.build
    builder = new
    yield(builder)
    builder.production
  end

  def initialize
    @production = Production.new
  end

  def set_installation(installation)
    @production.installation = installation
  end

  def set_station(station)
    @production.station = station
  end

  def set_station_city(city)
    @production.station_city = city
  end

  def set_station_state(state)
    @production.station_state = state
  end

  def set_ac_output(full_output)
    @production.ac_jan = full_output[0].round(2)
    @production.ac_feb = full_output[1].round(2)
    @production.ac_mar = full_output[2].round(2)
    @production.ac_apr = full_output[3].round(2)
    @production.ac_may = full_output[4].round(2)
    @production.ac_jun = full_output[5].round(2)
    @production.ac_jul = full_output[6].round(2)
    @production.ac_aug = full_output[7].round(2)
    @production.ac_sep = full_output[8].round(2)
    @production.ac_oct = full_output[9].round(2)
    @production.ac_nov = full_output[10].round(2)
    @production.ac_dec = full_output[11].round(2)
  end

  def set_dc_output(full_output)
    @production.dc_jan = full_output[0].round(2)
    @production.dc_feb = full_output[1].round(2)
    @production.dc_mar = full_output[2].round(2)
    @production.dc_apr = full_output[3].round(2)
    @production.dc_may = full_output[4].round(2)
    @production.dc_jun = full_output[5].round(2)
    @production.dc_jul = full_output[6].round(2)
    @production.dc_aug = full_output[7].round(2)
    @production.dc_sep = full_output[8].round(2)
    @production.dc_oct = full_output[9].round(2)
    @production.dc_nov = full_output[10].round(2)
    @production.dc_dec = full_output[11].round(2)
  end
end
