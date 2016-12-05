json.partial! 'api/events/event', event: @event

json.set! :requirements do
  json.array! @event.requirements do |requirement|
    json.extract! requirement, :title
  end
end
