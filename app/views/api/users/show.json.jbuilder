json.extract! @user, :username, :session_token, :fname, :lname, :gender, :email, :phone_number, :about_me, :image_url, :resume_url, :tips_cert, :no_vis_tats, :no_felonies, :valid_dl, :admin, :company_id

json.set! :age, ((Date.today - @user.dob).to_i / 365.25).to_i
