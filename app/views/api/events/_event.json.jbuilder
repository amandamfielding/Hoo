json.extract! event, :id, :title, :lat, :lng, :city, :state, :event_type, :image_url, :description, :pay, :pay_freq, :start_date, :end_date

json.set! :company_name, event.company.name

json.set! :company_website, event.company.website_url

json.set! :admin_name, event.admin.fname + " " + event.admin.lname

json.set! :applicant_count, event.requests.count
