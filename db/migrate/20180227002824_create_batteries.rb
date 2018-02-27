class CreateBatteries < ActiveRecord::Migration[5.1]
  def change
    create_table :batteries do |t|
      t.decimal :capacity
      t.references :installation, foreign_key: true

      t.timestamps
    end
  end
end
