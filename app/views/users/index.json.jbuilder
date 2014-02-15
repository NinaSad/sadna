json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :department, :job_title
  json.url user_url(user, format: :json)
end
