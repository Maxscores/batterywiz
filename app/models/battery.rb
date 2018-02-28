class Battery < ApplicationRecord
  belongs_to :installation
  validates_presence_of :capacity, :daily_net_energy, :hourly_net_energy

  def battery_level_at_start_of_day(day)
    daily_net_energy[0..(day-1)].sum % capacity
  end
end
