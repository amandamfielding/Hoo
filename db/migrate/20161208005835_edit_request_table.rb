class EditRequestTable < ActiveRecord::Migration
  def change
    remove_column :requests, :accepted
    add_column :requests, :accepted, :boolean, default: false
  end
end
