json.array!(@scene_connectors) do |scene_connector|
  json.extract! scene_connector, :id
  json.url scene_connector_url(scene_connector, format: :json)
end
