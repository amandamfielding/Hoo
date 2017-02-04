if @request
  json.partial! 'api/requests/request', request: @request
else
  {}
end
