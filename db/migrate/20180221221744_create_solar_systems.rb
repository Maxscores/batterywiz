class CreateSolarSystems < ActiveRecord::Migration[5.1]
  def change
    create_table :solar_systems do |t|
      t.references :installation, foreign_key: true
      t.decimal :capacity
      t.integer :module_type
      t.integer :losses
      t.integer :array_type
      t.integer :tilt
      t.integer :azimuth

      t.timestamps
    end
  end
end
