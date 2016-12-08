class RemoveBody < ActiveRecord::Migration
  def change
    remove_column :requests, :body
  end
end
