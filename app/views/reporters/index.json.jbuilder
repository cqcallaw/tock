json.array!(@reporters) do |reporter|
  json.extract! reporter, :id, :user_id
  json.url reporter_url(reporter, format: :json)
end
