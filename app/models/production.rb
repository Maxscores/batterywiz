class Production < ApplicationRecord
  belongs_to :installation
  validates_presence_of :station,
                        :station_city,
                        :station_state

  def hourly_production_by_day
    hourly_dc.each_slice(24).to_a.map do |day_hourly_production|
      day_hourly_production
    end
  end

  def daily_production
    hourly_dc.each_slice(24).to_a.map do |day_hourly_production|
      day_hourly_production.sum
    end
  end

  def total_production
    daily_production.sum / 1000
  end

  def carbon_offset
    total_production * LBS_CO2_PER_KWH / 2000
  end

  def production_by_month
    [
      dc_jan,
      dc_feb,
      dc_mar,
      dc_apr,
      dc_may,
      dc_jun,
      dc_jul,
      dc_aug,
      dc_sep,
      dc_oct,
      dc_nov,
      dc_dec
    ]
  end

  LBS_CO2_PER_KWH = 1.123
end
