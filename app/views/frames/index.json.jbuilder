json.array!(@frames) do |frame|
  json.extract! frame, :id, :description, :story_id
  json.url frame_url(frame, format: :json)
end
