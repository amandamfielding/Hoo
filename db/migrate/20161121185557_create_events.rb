class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :admin_id, null: false
      t.string :title, null: false
      t.float :lat, null: false
      t.float :lng, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :event_type
      t.string :image_url
      t.text :description, null: false
      t.integer :pay, null: false
      t.string :pay_freq, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.timestamps null: false
    end
  end
end
