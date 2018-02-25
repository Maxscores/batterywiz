class MonthlySolarOutput < ApplicationRecord
  def self.find_or_get_by_zipcode(zipcode)
    if solar_output = MonthlySolarOutput.find_by(zipcode: zipcode)
      solar_output
    else
      data = NrelService.get_monthly_solar_output(zipcode)
      MonthlySolarOutput.create(zipcode: zipcode,
        jan: data[:outputs][:avg_dni][:monthly][:jan],
        feb: data[:outputs][:avg_dni][:monthly][:feb],
        mar: data[:outputs][:avg_dni][:monthly][:mar],
        apr: data[:outputs][:avg_dni][:monthly][:apr],
        may: data[:outputs][:avg_dni][:monthly][:may],
        jun: data[:outputs][:avg_dni][:monthly][:jun],
        jul: data[:outputs][:avg_dni][:monthly][:jul],
        aug: data[:outputs][:avg_dni][:monthly][:aug],
        sep: data[:outputs][:avg_dni][:monthly][:sep],
        oct: data[:outputs][:avg_dni][:monthly][:oct],
        nov: data[:outputs][:avg_dni][:monthly][:nov],
        dec: data[:outputs][:avg_dni][:monthly][:dec])
    end
  end

  def avg_daily_production
    [jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec]
  end
end
