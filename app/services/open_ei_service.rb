class OpenEiService
  def connection
    Faraday.new(url: "https://api.openei.org")
  end

  def get_utility_rates(params)
    response = connection.get("/utility_rates") do |request|
      request.params = {version: 'latest',
                        format: 'json',
                        api_key: ENV['OPEN_EI_KEY'],
                        lat: params[:lat],
                        lon: params[:lon],
                        sector: 'Residential',
                        approved: true,
                        detail: 'full'}
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
