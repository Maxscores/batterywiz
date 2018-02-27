class Battery < ApplicationRecord
  belongs_to :installation

  def battery_level_at_start_of_day(day)
    daily_net_energy[0..(day-1)].sum
  end
end
