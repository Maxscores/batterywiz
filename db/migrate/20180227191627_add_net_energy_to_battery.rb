class AddNetEnergyToBattery < ActiveRecord::Migration[5.1]
  def change
    add_column :batteries, :daily_net_energy, :decimal, array: true
    add_column :batteries, :hourly_net_energy, :decimal, array: true
  end
end
