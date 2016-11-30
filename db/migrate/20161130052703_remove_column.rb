class RemoveColumn < ActiveRecord::Migration
  def change
    remove_column :requirements, :event_id
  end
end
