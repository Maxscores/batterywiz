class NrelService
  def self.connection
    Faraday.new(url: 'https://developer.nrel.gov', headers: {'X-Api-Key' => ENV["NREL_API_KEY"]})
  end

  def self.get_estimated_performance(params)
    response = connection.get("/api/pvwatts/v5.json") do |request|
      request.params = {system_capacity: params[:capacity],
                        module_type: SolarSystem.module_types[params[:module_type]],
                        losses: params[:losses].to_i / 100,
                        array_type: SolarSystem.array_types[params[:array_type]],
                        tilt: params[:tilt],
                        azimuth: params[:azimuth],
                        radius: 0,
                        dataset: 'tmy3',
                        address: params[:zipcode],
                        timeframe: 'hourly'}
    end
    parseJSON(response)
  end

  def self.parseJSON(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_avg_utility_rate(zipcode)
    response = connection.get("/api/utility_rates/v3.json") do |request|
      request.params = {address: zipcode}
    end
    parseJSON(response)
  end

  def self.get_monthly_solar_output(zipcode)
    response = connection.get("/api/solar/solar_resource/v1.json") do |request|
      request.params = {address: zipcode}
    end
    parseJSON(response)
  end

end
