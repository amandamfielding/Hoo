class CreateEventRequirements < ActiveRecord::Migration
  def change
    create_table :event_requirements do |t|
      t.integer :event_id, null: false
      t.integer :requirement_id, null: false
      t.timestamps null: false
    end
  end
end
