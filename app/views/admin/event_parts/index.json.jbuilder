json.array!(@event_parts) do |event_part|
  json.extract! event_part, :id
  json.url event_part_url(event_part, format: :json)
end
