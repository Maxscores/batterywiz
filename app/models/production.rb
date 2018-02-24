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


end
