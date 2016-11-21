class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.string :title, null: false
      t.integer :event_id, null: false
      t.string :icon_url
      t.timestamps null: false
    end
  end
end
