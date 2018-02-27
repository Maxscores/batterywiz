class AddColumnsToProduction < ActiveRecord::Migration[5.1]
  def change
    add_column :productions, :hourly_ac, :decimal, array: true
    add_column :productions, :hourly_dc, :decimal, array: true
  end
end
