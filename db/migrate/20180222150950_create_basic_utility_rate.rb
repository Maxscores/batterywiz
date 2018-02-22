class CreateBasicUtilityRate < ActiveRecord::Migration[5.1]
  def change
    create_table :basic_utility_rates do |t|
      t.decimal :residential
      t.decimal :commercial
      t.decimal :industrial
      t.string :zipcode

      t.timestamps
    end
  end
end
