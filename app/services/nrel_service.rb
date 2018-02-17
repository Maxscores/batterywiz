class NrelService
  def connection
    Faraday.new(url: 'https://developer.nrel.gov', headers: {'X-Api-Key' => ENV["NREL_API_KEY"]})
  end

  def get_estimated_performance(params)
    response = connection.get("/api/pvwatts/v5.json") do |request|
      request.params = {system_capacity: params[:capacity],
                        module_type: params[:module_type],
                        losses: params[:losses].to_i / 100,
                        array_type: params[:array_type],
                        tilt: params[:tilt],
                        azimuth: params[:azimuth],
                        radius: 0,
                        dataset: 'tmy3',
                        lat: params[:lat],
                        lon: params[:lon]}

    end
    JSON.parse(response.body, symbolize_names: true)
  end

end
