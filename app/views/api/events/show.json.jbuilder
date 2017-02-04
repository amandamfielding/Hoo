json.partial! 'api/events/event', event: @event

ids = []
@event.requirements.each do |requirement|
  ids << requirement.id
end

json.set! :requirements do
  json.array! ids
end
