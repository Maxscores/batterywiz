class AddIndexToBasicUtilityRate < ActiveRecord::Migration[5.1]
  def change
    add_index :basic_utility_rates, :zipcode
  end
end
