json.array!(@reporters) do |reporter|
  json.extract! reporter, :id, :email, :name, :interval, :user_id
  json.url reporter_url(reporter, format: :json)
end
