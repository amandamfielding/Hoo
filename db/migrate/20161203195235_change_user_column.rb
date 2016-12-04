class ChangeUserColumn < ActiveRecord::Migration
  def change
    rename_column :users, :felonies, :no_felonies
    rename_column :users, :vis_tats, :no_vis_tats
  end
end
