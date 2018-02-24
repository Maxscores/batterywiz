class Production < ApplicationRecord
  belongs_to :installation
  validates_presence_of :station,
                        :station_city,
                        :station_state,
                        :ac_jan,
                        :ac_feb,
                        :ac_mar,
                        :ac_apr,
                        :ac_may,
                        :ac_jun,
                        :ac_jul,
                        :ac_aug,
                        :ac_sep,
                        :ac_nov,
                        :ac_dec,
                        :dc_jan,
                        :dc_feb,
                        :dc_mar,
                        :dc_apr,
                        :dc_may,
                        :dc_jun,
                        :dc_jul,
                        :dc_aug,
                        :dc_sep,
                        :dc_nov,
                        :dc_dec

  def self.find_or_get_production_data(system_details)
    if installation.production
      installation.production
    else
      production = ProductionBuilder.build do |production|
        projection = NrelService.get_estimated_performance(system_details)
        production.set_installation(installation)
        production.set_station(projection[:station_info][:location])
        production.set_station_city(projection[:station_info][:city])
        production.set_station_state(projection[:station_info][:state])
        production.set_ac_output(projection[:outputs][:ac_monthly])
        production.set_dc_output(projection[:outputs][:dc_monthly])
      end
      production.save!
      production
    end
  end
end
