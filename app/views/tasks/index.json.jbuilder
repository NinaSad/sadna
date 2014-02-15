json.array!(@tasks) do |task|
  json.extract! task, :id, :title, :priority, :description, :status, :due_date, :creation_date
  json.url task_url(task, format: :json)
end
