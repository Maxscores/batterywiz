class Production < ApplicationRecord
  belongs_to :installation
  validates_presence_of :station,
                        :station_city,
                        :station_state

end
