class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :user_id, null: false
      t.integer :event_id, null: false
      t.boolean :accepted, null: false
      t.timestamps null: false
    end
    add_index :requests, [:event_id, :user_id], unique: true
  end
end
