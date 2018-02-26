class AddBatteryCapacityToInstallations < ActiveRecord::Migration[5.1]
  def change
    add_column :installations, :battery_capacity, :decimal
  end
end
