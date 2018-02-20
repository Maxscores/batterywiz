class CreateInstallations < ActiveRecord::Migration[5.1]
  def change
    create_table :installations do |t|
      t.text :zipcode
      t.decimal :utility_rate

      t.timestamps
    end
  end
end
