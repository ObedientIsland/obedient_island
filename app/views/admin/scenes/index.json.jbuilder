json.array!(@scenes) do |scene|
  json.extract! scene, :id
  json.url scene_url(scene, format: :json)
end
