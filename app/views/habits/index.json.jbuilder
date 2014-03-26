json.array!(@habits) do |habit|
  json.extract! habit, :id, :description, :done, :interval
  json.url habit_url(habit, format: :json)
end
