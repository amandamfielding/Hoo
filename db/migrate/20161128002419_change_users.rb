class ChangeUsers < ActiveRecord::Migration
  def change
    remove_column :users, :tips_cert
    remove_column :users, :vis_tats
    remove_column :users, :felonies
    remove_column :users, :valid_dl
    remove_column :users, :admin
    add_column :users, :tips_cert, :boolean, default: false
    add_column :users, :vis_tats, :boolean, default: false
    add_column :users, :felonies, :boolean, default: false
    add_column :users, :valid_dl, :boolean, default: false
    add_column :users, :admin, :boolean, default: false
  end
end
