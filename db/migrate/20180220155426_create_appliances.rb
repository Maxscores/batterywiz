class CreateAppliances < ActiveRecord::Migration[5.1]
  def change
    create_table :appliances do |t|
      t.string :name
      t.integer :avg_monthly_kwh
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
