json.array!(@tasks) do |task|
  json.extract! task, :id, :description, :dueDate, :progress
  json.url task_url(task, format: :json)
end
