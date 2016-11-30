json.extract! event, :admin_id, :title, :lat, :lng, :city, :state, :event_type, :image_url, :description, :pay, :pay_freq, :start_date, :end_date

json.set! :requirements do
  json.partial! event.requirements, partial: 'api/requirements/requirement', as: :requirement
end
