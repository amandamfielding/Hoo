class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
      t.string :session_token, null: false
      t.string :fname, null: false
      t.string :lname, null: false
      t.string :gender, null: false
      t.date :dob, null: false
      t.string :email, null: false
      t.string :phone_number, null: false
      t.text :about_me
      t.string :image_url
      t.string :resume_url
      t.boolean :tips_cert, null: false
      t.boolean :vis_tats, null: false
      t.boolean :felonies, null: false
      t.boolean :valid_dl, null: false
      t.boolean :admin, null: false
      t.boolean :company_id
      t.timestamps null: false
    end
    add_index :users, :session_token, unique: true
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
  end
end
