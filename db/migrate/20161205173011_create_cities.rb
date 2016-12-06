class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :city, null: false
      t.string :state_code, null: false
      t.integer :zip, null: false
      t.integer :latitude, null: false
      t.integer :longitude, null: false
      t.string :county, null: false
      t.timestamps null: false
    end
  end
end
