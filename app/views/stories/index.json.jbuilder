json.array!(@stories) do |story|
  json.extract! story, :id, :name, :description, :token, :cover
  json.url story_url(story, format: :json)
end
