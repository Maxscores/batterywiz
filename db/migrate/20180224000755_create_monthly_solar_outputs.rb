class CreateMonthlySolarOutputs < ActiveRecord::Migration[5.1]
  def change
    create_table :monthly_solar_outputs do |t|
      t.string :zipcode, index: true
      t.decimal :jan
      t.decimal :feb
      t.decimal :mar
      t.decimal :apr
      t.decimal :may
      t.decimal :jun
      t.decimal :jul
      t.decimal :aug
      t.decimal :sep
      t.decimal :oct
      t.decimal :nov
      t.decimal :dec


      t.timestamps
    end
  end
end
