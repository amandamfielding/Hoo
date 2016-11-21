class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :logo_url
      t.string :image_url
      t.string :website_url
      t.string :facebook_url
      t.timestamps null: false
    end
  end
end
