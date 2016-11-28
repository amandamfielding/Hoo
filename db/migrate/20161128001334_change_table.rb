class ChangeTable < ActiveRecord::Migration
  def change
    remove_column :users, :tips_cert
    remove_column :users, :vis_tats
    remove_column :users, :felonies
    remove_column :users, :valid_dl
    remove_column :users, :admin
    add_column :users, :tips_cert, :boolean, null: false, :default => false
    add_column :users, :vis_tats, :boolean, null: false, :default => false
    add_column :users, :felonies, :boolean, null: false, :default => false
    add_column :users, :valid_dl, :boolean, null: false, :default => false
    add_column :users, :admin, :boolean, null: false, :default => false
  end
end
