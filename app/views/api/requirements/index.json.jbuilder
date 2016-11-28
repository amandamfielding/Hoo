json.array! @requirements do |requirement|
  json.partial! 'api/requirements/requirement', requirement: requirement
end
