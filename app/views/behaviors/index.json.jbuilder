json.array!(@behaviors) do |behavior|
  json.extract! behavior, :id, :description, :time
  json.url behavior_url(behavior, format: :json)
end
