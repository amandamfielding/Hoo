class ChangeColumn < ActiveRecord::Migration
  def change
    remove_column :users, :company_id
    add_column :users, :company_id, :integer
  end
end
