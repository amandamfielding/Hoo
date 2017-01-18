json.extract! request, :event_id, :accepted, :id

user = User.find(request.user_id)
json.set! :fname, user.fname
json.set! :lname, user.lname
json.set! :user_id, user.id
