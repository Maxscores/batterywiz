class CreateProduction < ActiveRecord::Migration[5.1]
  def change
    create_table :productions do |t|
      t.references :installation, foreign_key: true
      t.string :station
      t.string :station_city
      t.string :station_state
      t.decimal :ac_jan
      t.decimal :ac_feb
      t.decimal :ac_mar
      t.decimal :ac_apr
      t.decimal :ac_may
      t.decimal :ac_jun
      t.decimal :ac_jul
      t.decimal :ac_aug
      t.decimal :ac_sep
      t.decimal :ac_oct
      t.decimal :ac_nov
      t.decimal :ac_dec
      t.decimal :dc_jan
      t.decimal :dc_feb
      t.decimal :dc_mar
      t.decimal :dc_apr
      t.decimal :dc_may
      t.decimal :dc_jun
      t.decimal :dc_jul
      t.decimal :dc_aug
      t.decimal :dc_sep
      t.decimal :dc_oct
      t.decimal :dc_nov
      t.decimal :dc_dec

      t.timestamps
    end
  end
end
